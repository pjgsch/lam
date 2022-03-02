%**********************************************************************
%
% lamscm.m
%
% [S,C,ld0,zn] = lamscm(lam,et,mode);
%
% S,C    laminate stiffness and compliance matrix.
% zn     neutral line in [x,y,xy]-direction.
% ld0    virtual cross-sectional load due to temperature and humidity.
%
% The stacking of the laminate and the layer material properties 
% are available in the array 'lam' . The number of rows equals the 
% number of plies.
%
% The columns contain values of the next variables 
% (l = longitidinal; t = transversal) :
%
%   z-  z+  fie  E-l  E-t  nu-tl  G-l  alfa-l  alfa-t  beta-l  beta-t
%
% et     strains due to temperature and humidity in 1,2,12-directions.
% mode(nk) indicates failed plies and failure mode:
%     mode(k)=0 : not failed
%     mode(k)=1 : matrix failure
%     mode(k)=2 : fiber failure
%
%======================================================================

function [S,C,ld0,zn] = lamscm(lam,et,mode);

nk = size(lam,1);                                % number of plies

lam1 = ( lam(:,2) - lam(:,1) )*1e-3;             % units in [m]
lam2 = ( lam(:,2).^2 - lam(:,1).^2 )*1e-6;       % units in [m]
lam3 = ( lam(:,2).^3 - lam(:,1).^3 )*1e-9;       % units in [m]

N0 = zeros(3,1); M0 = zeros(3,1); 
A = zeros(3); B = zeros(3); D = zeros(3);

for k = 1:nk

  fie = lam(k,3)*pi/180;                         % ply-angle in radians
  
  if mode(k)>0, 
    Sk(2:3,1:3) = zeros(2,3);

    if mode(k)==2, 
      Sk(1,1:3) = zeros(1,3);
    else,          
      Sk(1,1:3) = [lam(k,4) 0 0];
    end;
  else,         
    Ck = complm2(lam(k,4),lam(k,5),lam(k,6),lam(k,7));
    Sk = inv(Ck);
  end;

% units in [GPa] = [Nm-2] * e9

  [Tk] = trans(fie);
  Tki  = inv(Tk);
  Skt  = Tki'*Sk*Tki;
 
  Ak  = lam1(k) * Skt;
  Bk  = lam2(k) * (1/2)*Skt;
  Dk  = lam3(k) * (1/3)*Skt;
  etk = Tk*et(k,1:3)';

  N0 = N0 + Ak*etk;  
  M0 = M0 + Bk*etk;

  A = A + Ak;        
  B = B + Bk;         
  D = D + Dk;
end;

Ai = inv(A);                  
f  = inv(-B*Ai*B+D);
zn = diag(f*B*Ai)./diag(f);              % units in [m]

S = [  A  -B;                            % units :S = | Nm-1  N  | *1e9
      -B   D  ];                         %            | N     Nm |

C   = inv(S);            
ld0 = [ N0' M0'];

S = S*1e9; C = C*1e-9; ld0 = ld0*1e9;      % units in [N] and [m]

%**********************************************************************
