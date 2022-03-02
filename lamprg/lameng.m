%======================================================================
% lameng.m
% 
% Calculates the elastically stored energy in a laminate.
%
%======================================================================

function [eng] = lameng(lam,e0,kr);

nk = size(lam,1);

eng = 0;

for k=1:nk

  fie = lam(k,3)*pi/180;
  Tk  = trans(fie);     % this is Tei
  Tki = inv(Tk);        % this is Te

% Take care : in the theory we use C for Stiffness and 
% S for compliance.
% We have to change this in the future in the program.

  Ck  = complm2(lam(k,4),lam(k,5),lam(k,6),lam(k,7)); % compliance
  Sk  = inv(Ck);                                      % stiffness
  Skt = Tki'*Sk*Tki;    % theory : C = Tsi*Ck*Te = Te'*Ck*Te

  zt  = lam(k,2)*1e-3;   zb = lam(k,1)*1e-3;
  Skt = Skt*1e9;

  eng = eng ...
        + (1/2) * e0'*Skt*e0 * (zt - zb) ...
        - (1/4) * kr'*Skt*e0 * (zt^2 - zb^2) ...
        - (1/4) * e0'*Skt*kr * (zt^2 - zb^2) ...
        + (1/6) * kr'*Skt*kr * (zt^3 - zb^3);
end;

%**********************************************************************


  
