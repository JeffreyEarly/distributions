classdef RayleighDistribution < Distribution
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        sigma
    end
    
    methods
        function self = RayleighDistribution(sigma)
            arguments
                sigma (1,1) {mustBeNumeric,mustBeReal,mustBeFinite,mustBePositive}
            end
            self.sigma = sigma;
            self.pdf = @(z) z.*exp(-(z.*z)/(2*sigma*sigma))/(sigma*sigma);
            self.cdf = @(z) 1 - exp(-(z.*z)/(2*sigma*sigma));
%             self.w = @(z) sigma*sigma*ones(size(z));
            self.variance = (4-pi)*sigma*sigma/2;
            self.logPDF = @(z) log(z)-(z.*z)/(2*sigma*sigma);
            
%             self.dPDFoverZ = @(z) -exp(-(z.*z)/(2*sigma*sigma))/(sigma*sqrt(2*pi))/(sigma*sigma);
        end
        
    end
end
