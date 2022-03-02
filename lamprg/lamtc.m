%**********************************************************************
%
% lamtc.m
%
% [et] = lamtc(dT,c,lam)
%
% Ply strains due to temperature differences and humidity absorption
% are calculated in the local, material coordinate system.
% The array 'lam' provides the coefficients of thermal and humidity
% expansion (*1e6) of the individual plies in columns 8-11
%
% dT         temperature difference in [Kelvin]
% c          percentage damp absorption
% lam        laminate build-up
%
% et         local thermal and humidity strains
%
%======================================================================

function [et] = lamtc(dT,c,lam);

n = size(lam); nk = n(1) ;                            % number of plies

for k=1:nk
  et(k,1:3) = [lam(k,8:9),0] * dT(k) + [lam(k,10:11),0] * c(k);
end;

et = et * 1e-6;                                  

%**********************************************************************
