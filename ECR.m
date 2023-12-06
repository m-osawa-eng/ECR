function [ECR_all] = ECR(EC_input, EC_output)
% Calculation of Effective compression ratio.
% EC_input  - compression range of input
% EC_output - compression range of output 
% ECR_all - Effective compression ratio
ECR_all = EC_input./EC_output;
end