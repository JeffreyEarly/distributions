classdef UniformDistribution < Distribution
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        a
        b
    end
    
    methods
        function self = UniformDistribution(a,b)
            arguments
                a (1,1) {mustBeNumeric,mustBeReal,mustBeFinite} = -0.5
                b (1,1) {mustBeNumeric,mustBeReal,mustBeFinite} = 0.5
            end
            if nargin == 1
                error('You must specify both interval endpoints.');
            end
            self.a = a;
            self.b = b;
            self.pdf = @(z) (z < self.a | z > self.b)*0 + (z >= self.a & z <= self.b)*(1/(self.b-self.a)) ;
            self.cdf = @(z) (z < self.a)*0 + (z >= self.a & z <= self.b)*((z-self.a)/(self.b-self.a)) +  (z > self.b)*1;
%             self.w = @(z)((nu/(nu+1))*sigma^2*(1+z.^2/(nu*sigma^2)));
            self.variance = (1/12)*(self.b-self.a)^2;
            
%             self.dPDFoverZ = @(z) -2*(a*m/c)*(1+z.*z/c).^(-m-1);
%             self.logPDF = @(z) -m*log(1+z.*z/c);
        end
        
    end
    
end
