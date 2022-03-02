%**********************************************************************
% 2 ply 
%
% z-  z+   ang    El    Et    Gnlt  Glt   
% mm  mm   deg    GPa   GPa   -     GPa

% Strengths in Pa

Tl = 1e6; Cl = 0.1e6; Tt = 0.01e6; Ct = 0.05e6; SS = 0.02e6; ILSS = 0.05e6;

fm = [ 0 0 ];

lam = [ 
   0   1   ang1   100   20    0.3   10  
  -1   0   ang2   100   20    0.3   10   ];

ld = [0 100 0 0 0 0];

runlam;
%[npl,et,S,C,e0,kr,rek,str]=main(lam,ld);

Gkxx = kr(1); Gkyy = kr(2); Gkxy = kr(3);

for ii=1:npl
  Gs11t(ii) = max( [ 0 str(2*ii-1,4) str(2*ii,4) ] );
  Gs11c(ii) = min( [ 0 str(2*ii-1,4) str(2*ii,4) ] );
  Gs22t(ii) = max( [ 0 str(2*ii-1,5) str(2*ii,5) ] );
  Gs22c(ii) = min( [ 0 str(2*ii-1,5) str(2*ii,5) ] );
  Gs12(ii) =  max( [ abs(str(2*ii-1,6)) abs(str(2*ii,6)) ] );
end;

for ii=1:npl-1
  ilsxx(ii) = abs(str(2*ii,1)-str(2*ii+1,1));
  ilsyy(ii) = abs(str(2*ii,2)-str(2*ii+1,2));
  ilsxy(ii) = abs(str(2*ii,3)-str(2*ii+1,3));
end;

%**********************************************************************
