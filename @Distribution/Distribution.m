classdef (Abstract) Distribution
    % an abstract class representing a distribution
    %   Detailed explanation goes here
    %
    % - Declaration: classdef (Abstract) Distribution
    
    properties
        rho % autocorrelation function
        w % 'weight' function
        logPDF % log of the pdf
    end

    properties (SetAccess = protected)
        % probability density function (pdf)
        %
        % The pdf is specified as a function_handle that takes a single
        % argument (possible a vector) and turns the pdf evaluated for each
        % point in the vector.
        %
        % - Topic: Primary attributes
        % - Returns pdf: a function_handle that takes a single argument
        pdf

        % cumulative distribution function (cdf)
        %
        % The cdf is specified as a function_handle that takes a single
        % argument (possible a vector) and turns the cdf evaluated for each
        % point in the vector.
        %
        % - Topic: Primary attributes
        % - Returns pdf: a function_handle that takes a single argument
        cdf

        zrange = [-Inf Inf] % range of support
        variance % total variance
    end

    properties (Dependent)
        sigma0 % initial seed for weight function (set by default to w(sigma0)=sigma0^2)
    end

    properties (Access = protected)
        dPDFOverZ % derivative of the pdf wrt z, divided by z
        logPDFNorm
    end
    
    
    methods
        function z = locationOfCDFPercentile(self, alpha)
            arguments
                self (1,1) Distribution
                alpha (1,1) {mustBeNumeric,mustBeReal,mustBeFinite,mustBeGreaterThan(alpha,0),mustBeLessThan(alpha,1)}
            end
            z = fminsearch(@(z) abs(self.cdf(z)-alpha),0);
        end
        
        function var = varianceInRange(self,zmin,zmax)
            arguments
                self (1,1) Distribution
                zmin (1,1) {mustBeNumeric,mustBeReal}
                zmax (1,1) {mustBeNumeric,mustBeReal}
            end
            zmin = Distribution.truncateToSupport(zmin,self.zrange);
            zmax = Distribution.truncateToSupport(zmax,self.zrange);
            var = integral( @(z) z.*z.*self.pdf(z),zmin,zmax);
        end
        
        function var = varianceInPercentileRange(self,pctmin,pctmax)
            arguments
                self (1,1) Distribution
                pctmin (1,1) {mustBeNumeric,mustBeReal,mustBeFinite,mustBeGreaterThan(pctmin,0),mustBeLessThan(pctmin,1)}
                pctmax (1,1) {mustBeNumeric,mustBeReal,mustBeFinite,mustBeGreaterThan(pctmax,0),mustBeLessThan(pctmax,1)}
            end
            zmin = self.locationOfCDFPercentile(pctmin);
            zmax = self.locationOfCDFPercentile(pctmax);
            var = self.varianceInRange(zmin,zmax);
        end
        
        % initial weighting should start at the inflection point of the
        % weight function
        function sigma0 = get.sigma0(self)
            sigma0 = fminsearch( @(x) abs(self.w(x)-x^2),sqrt(self.variance));
        end
        
        function totalError = andersonDarlingError(self,epsilon)
            arguments
                self (1,1) Distribution
                epsilon {mustBeNumeric,mustBeReal}
            end
            Y = sort(epsilon);
            n = length(Y);
            
            s = ((2*(1:n)'-1)/n) .* (log(self.cdf(Y)) + log(1-self.cdf(flip(Y))));
            
            totalError = -n-sum(s);
        end
        
        function totalError = andersonDarlingInterquartileError(self,epsilon)
            arguments
                self (1,1) Distribution
                epsilon {mustBeNumeric,mustBeReal}
            end
            if issorted(epsilon)
                Y = epsilon;
            else
                Y = sort(epsilon);
            end
            n = length(Y);
            
            s = ((2*(1:n)'-1)/n) .* (log(self.cdf(Y)) + log(1-self.cdf(flip(Y))));
            sIQ = s(floor(n/4):ceil(3*n/4));
            
            totalError = length(sIQ)-sum(sIQ);
        end
        
        function totalError = kolmogorovSmirnovError(self,epsilon,zmin,zmax)
            arguments
                self (1,1) Distribution
                epsilon {mustBeNumeric,mustBeReal}
                zmin {mustBeNumeric,mustBeReal,mustBeScalarOrEmpty} = []
                zmax {mustBeNumeric,mustBeReal,mustBeScalarOrEmpty} = []
            end

            if nargin == 4
                x = sort(epsilon( epsilon > zmin & epsilon < zmax ));
                A = 1/(self.cdf(zmax)-self.cdf(zmin));
                b = self.cdf(zmin);
            else
                if issorted(epsilon)
                    x = epsilon;
                else
                    x = sort(epsilon);
                end
                A = 1;
                b = 0;
            end
            
            n = length(x);
            y_data = (1:n)'/n;
            y = A*(self.cdf(x)-b);
            
            D = max(abs(y-y_data));
            
            totalError = (sqrt(n) + 0.12 + 0.11/sqrt(n))*D;
            if isempty(totalError)
                totalError = Inf;
            end
        end
        
        function totalError = kolmogorovSmirnovInterquartileError(self,epsilon)
            arguments
                self (1,1) Distribution
                epsilon {mustBeNumeric,mustBeReal}
            end
            x = sort(epsilon);
            n = length(x);
            y_data = (1:n)'/n;
            y = self.cdf(x);
            
            ks = y-y_data;
            DIQ = max(abs(ks(floor(n/4):ceil(3*n/4))));
            n = length(DIQ);
            
            totalError = (sqrt(n) + 0.12 + 0.11/sqrt(n))*DIQ;
        end
        
        function y = rand(self,varargin)
            arguments
                self (1,1) Distribution
            end
            arguments (Repeating)
                varargin {mustBeNumeric,mustBeReal,mustBeFinite,mustBeInteger,mustBeNonnegative}
            end
            sz = Distribution.sizeVectorFromInputs(varargin{:});
            n = prod(sz);
            pct = 1/1e6;
            zmin = self.locationOfCDFPercentile(pct/2);
            zmax = self.locationOfCDFPercentile(1-pct/2);
            binEdges = linspace(zmin,zmax,1e6+1)';
            binWidths = diff(binEdges);
            binEdges_cdf = self.cdf(binEdges); % maps the bin edges [0, 1]
            [~, ~, bin] = histcounts(rand(n+10,1),binEdges_cdf);
            bin(bin==0 | bin == length(binWidths)+1) = [];
            y = binEdges(bin) + rand(length(bin),1).*binWidths(bin);
            y = y(1:n);
            y = reshape(y,sz);
        end
        
        function y = noise(self,t)
            arguments
                self (1,1) Distribution
                t {mustBeNumeric,mustBeReal}
            end
            y = self.rand(size(t));
            
            % Some notes:
            % For a given autocorrelation function, the structure of C away
            % from the end points is uniform for each row. Thus, it's
            % possible to find this structure and convolve it as a kernal
            % across the random increments. That'd be much faster/less
            % memory.
            if ~isempty(self.rho)
                r = self.rho(t);
                C = toeplitz(r);
                
                % this is from maternchol.m and helps keep the matrix
                % positive definite.
                eps=1e-12;
                C=(C+eye(size(C))*eps)./(1+eps);
                
                
                T = chol(C,'lower');
                y = T*y;
            end
        end
    end

    methods (Static, Access = protected)
        function sz = sizeVectorFromInputs(varargin)
            if isempty(varargin)
                error('You must specify the size');
            end

            if numel(varargin) == 1
                sz = varargin{1};
                mustBeVector(sz);
                sz = reshape(sz,1,[]);
            else
                sz = zeros(1,numel(varargin));
                for i=1:numel(varargin)
                    validateattributes(varargin{i}, {'numeric'}, {'scalar'});
                    sz(i) = varargin{i};
                end
            end
        end
    end
    
    methods (Static, Access = private)
        function z = truncateToSupport(z,zrange)
            arguments
                z (1,1) {mustBeNumeric,mustBeReal}
                zrange (1,2) {mustBeNumeric,mustBeReal}
            end
            if z < zrange(1)
                z=zrange(1);
            end
            if z > zrange(2)
                z = zrange(2);
            end
        end
    end
end
