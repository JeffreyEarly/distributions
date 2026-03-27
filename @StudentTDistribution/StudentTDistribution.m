classdef StudentTDistribution < Distribution
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        sigma
        nu
    end
    
    methods
        function self = StudentTDistribution(options)
            arguments
                options.nu (1,1) {mustBeNumeric,mustBeReal,mustBeFinite,mustBePositive}
                options.sigma {mustBeNumeric,mustBeReal,mustBeFinite,mustBePositive,mustBeScalarOrEmpty} = []
                options.variance {mustBeNumeric,mustBeReal,mustBeFinite,mustBePositive,mustBeScalarOrEmpty} = []
            end

            nu = options.nu;
            self.nu = nu;
            hasSigma = ~isempty(options.sigma);
            hasVariance = ~isempty(options.variance);

            if hasSigma && hasVariance
                error('You can set either sigma or variance, not both.');
            elseif hasVariance && nu <= 2
                error('You cannot set the variance for nu <=2. You can only set sigma.');
            elseif hasVariance
                self.variance = options.variance;
                sigma = sqrt(((nu-2)/nu)*self.variance);
            elseif hasSigma
                sigma = options.sigma;
                self.variance = sigma*sigma*nu/(nu-2);
            else
                error('You must set either sigma or variance.');
            end
            self.sigma = sigma;
            
            self.pdf = @(z) gamma((nu+1)/2)./(sqrt(pi*nu)*sigma*gamma(nu/2)*(1+(z.*z)/(nu*sigma*sigma)).^((nu+1)/2));
            self.cdf = @(z) StudentTDistribution.studentTCDF(z/sigma,nu);
            self.w = @(z)((nu/(nu+1))*sigma^2*(1+z.^2/(nu*sigma^2)));
            
            
            a = gamma((nu+1)/2)./(sqrt(pi*nu)*sigma*gamma(nu/2));
            c = nu*sigma*sigma;
            m = (nu+1)/2;
            self.dPDFOverZ = @(z) -2*(a*m/c)*(1+z.*z/c).^(-m-1);
            self.logPDF = @(z) -m*log(1+z.*z/c) + log(gamma(m))-log(sqrt(pi*nu)*sigma*gamma(nu/2));
            self.logPDFNorm = log(gamma(m))-log(sqrt(pi*nu)*sigma*gamma(nu/2));

        end
        
    end
    
    methods (Static, Access = private)
       function p = studentTCDF(x,n)
            arguments
                x {mustBeNumeric,mustBeReal}
                n {mustBeNumeric,mustBeReal,mustBeFinite,mustBePositive}
            end
            % TCDF returns student cumulative distribtion function
            %
            % cdf = tcdf(x,DF);
            %
            % Computes the CDF of the students distribution
            %    with DF degrees of freedom
            % x,DF must be matrices of same size, or any one can be a scalar.
            %
            % see also: NORMCDF, NORMPDF, NORMINV
            
            % Reference(s):
            
            %	$Revision: 1.1 $
            %	$Id: tcdf.m,v 1.1 2003/09/12 12:14:45 schloegl Exp $
            %	Copyright (c) 2000-2003 by  Alois Schloegl <a.schloegl@ieee.org>
            
            %    This program is free software; you can redistribute it and/or modify
            %    it under the terms of the GNU General Public License as published by
            %    the Free Software Foundation; either version 2 of the License, or
            %    (at your option) any later version.
            %
            %    This program is distributed in the hope that it will be useful,
            %    but WITHOUT ANY WARRANTY; without even the implied warranty of
            %    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
            %    GNU General Public License for more details.
            %
            %    You should have received a copy of the GNU General Public License
            %    along with this program; if not, write to the Free Software
            %    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
            
            
            % check size of arguments
            n = x+n-x;	  % if this line causes an error, size of input arguments do not fit.
            z = n ./ (n + x.^2);
            
            % allocate memory
            p = z;
            p(x==Inf) = 1;
            
            % workaround for invalid arguments in BETAINC
            tmp   = isnan(z) | ~(n>0);
            p(tmp)= NaN;
            ix    = (~tmp);
            p(ix) = betainc (z(ix), n(ix)/2, 1/2) / 2;
            
            ix    = find(x>0);
            p(ix) = 1 - p(ix);
            
            % shape output
            p = reshape(p,size(z));
        end 
    end
end
