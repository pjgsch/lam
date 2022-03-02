%**********************************************************************
%
% mirror.m
%
% Mirrors the ply definition of a laminate if  z = 0  is the mid-plane.
% The arrays 'lam', 'fm', 'strb', 'rekb' and 'cr' are expanded.
%
%======================================================================

n = size(lam); nk = n(1);

for k = 1 : nk
  lam(nk+k,1) = -lam(nk-k+1,2);
  lam(nk+k,2) = -lam(nk-k+1,1);
  if     ls=='sl' , lam(nk+k,3) =  lam(nk-k+1,3);
  elseif ls=='al' , lam(nk+k,3) = -lam(nk-k+1,3); end;
  lam(nk+k,4) = lam(nk-k+1,4);
  lam(nk+k,5) = lam(nk-k+1,5);
  lam(nk+k,6) = lam(nk-k+1,6);
  lam(nk+k,7) = lam(nk-k+1,7);
  lam(nk+k,8) = lam(nk-k+1,8);
  lam(nk+k,9) = lam(nk-k+1,9);
  lam(nk+k,10) = lam(nk-k+1,10);
  lam(nk+k,11) = lam(nk-k+1,11);

  fm(nk+k) = fm(nk-k+1);

  for l=1:5 , strb(nk+k,l) = strb(nk-k+1,l); end;
  for l=1:5 , rekb(nk+k,l) = rekb(nk-k+1,l); end;

  cr(nk+k) = cr(nk-k+1);
end;

clear k; clear l;

%**********************************************************************
