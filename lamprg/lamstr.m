%**********************************************************************
%
% lamstr
%
% [e0,kr,rek,str] = lamstr(S,C,et,ld0,ld,lam,mode);
%
% Calculation of stresses and strains in the laminate.
%
% Input : S,C  stiffness and compliance matrix (units in [N] and [m])
%         et   strains of a ply due to temperature and humidity [1 2 12] 
%         ld0  array with virtual cross-sectional loads per
%              unit-of-length due to temperature and humidity
%         ld   array with cross-sectional loads per unit-of-length
%              ld = [Nx Ny Nxy Mx My Mxy] (units [Nm-1  N])
%         lam  array with laminate data
%         mode array with failure data (failure and failure mode)
% Output: e0   strains of midplane [x,y,xy]
%         kr   curvatures of midplane [x,y,xy]
%         rek  strains of the plies [x,y,xy,1,2,12]
%         str  stresses in the plies [x,y,xy,1,2,12] in [Pa]
%
%======================================================================

function [e0,kr,rek,str] = lamstr(S,C,et,ld0,ld,lam,mode);

nk = size(lam,1);                                     % number of plies  

df = C*(ld+ld0)';      
e0 = df(1:3);    
kr = df(4:6);

for k=1:nk

  fie=lam(k,3)*pi/180;

  if mode(k)>0, Sk(2:3,1:3) = zeros(2,3);
                if mode(k)==2, Sk(1,1:3) = zeros(1,3);
                else ,         Sk(1,1:3) = [lam(k,4) 0 0];
                end
  else,         Ck = complm2(lam(k,4),lam(k,5),lam(k,6),lam(k,7));
                Sk = inv(Ck);
  end;

% units in [GPa]

  [Tk] = trans(fie);
  Tki  = inv(Tk);
  Skt  = Tki'*Sk*Tki;

  for j=2:-1:1
    z = lam(k,j)*1e-3;                                   % units in [m]
    etk = Tk*et(k,1:3)';

    ekt = e0 - z*kr;            ek = Tki*ekt;
    skt = Skt*(ekt-etk);        sk = Tk'*skt;          % units in [GPa]

    skt = skt*1e9; sk = sk*1e9;                         % units in [Pa]

    rek(2*k-(j-1),1:3) = ekt'; rek(2*k-(j-1),4:6) = ek';
    str(2*k-(j-1),1:3) = skt'; str(2*k-(j-1),4:6) = sk';
  end;
end;

%**********************************************************************
