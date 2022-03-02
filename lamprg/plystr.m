%**********************************************************************
%
% function [ Gsmc Gsgc Gsav Gemc Gegc Geav ils ] = plystr(npl,str,rek);
%
% Gsmc : stresses in the material coordinate system
%  (p,1)   : maximum of Gs_11 in ply p
%  (p,2)   : minimum of Gs_11 in ply p
%  (p,3)   : maximum of Gs_22 in ply p
%  (p,4)   : minimum of Gs_22 in ply p
%  (p,5)   : maximum absolute value of Gs_12 in ply
% Gsgc : stresses in the global coordinate system
%  {p,#)   : max/min of Gs_xx, Gs_yy, Gs_xy in ply p
% Gsav : average stresses 
%  (p,1:3) : average global stresses (Gsxx, Gsyy, Gsxy)
%  (p,4:6) : average local  stresses (Gs11, Gs22, Gs12)
% Gemc : strains in the material coordinate system
% Gegc : strains in the global coordinate system
% Geav : average strains
% ils  : interlaminar shear stress
%  (p,1)   : absolute value Gs_xx difference in adjacent plies
%  (p,2)   : absolute value Gs_yy difference in adjacent plies
%  (p,3)   : absolute value Gs_xy difference in adjacent plies
%
%**********************************************************************

function [ Gsmc Gsgc Gsav Gemc Gegc Geav ils ] = plystr(npl,str,rek);

for ii=1:npl
  Gsmc(ii,1) = max( [ 0 str(2*ii-1,4) str(2*ii,4) ] );
  Gsmc(ii,2) = min( [ 0 str(2*ii-1,4) str(2*ii,4) ] );
  Gsmc(ii,3) = max( [ 0 str(2*ii-1,5) str(2*ii,5) ] );
  Gsmc(ii,4) = min( [ 0 str(2*ii-1,5) str(2*ii,5) ] );
  Gsmc(ii,5) = max( [ abs(str(2*ii-1,6)) abs(str(2*ii,6)) ] );
  Gsgc(ii,1) = max( [ 0 str(2*ii-1,1) str(2*ii,1) ] );
  Gsgc(ii,2) = min( [ 0 str(2*ii-1,1) str(2*ii,1) ] );
  Gsgc(ii,3) = max( [ 0 str(2*ii-1,2) str(2*ii,2) ] );
  Gsgc(ii,4) = min( [ 0 str(2*ii-1,2) str(2*ii,2) ] );
  Gsgc(ii,5) = max( [ abs(str(2*ii-1,3)) abs(str(2*ii,3)) ] );
  Gemc(ii,1) = max( [ 0 rek(2*ii-1,4) rek(2*ii,4) ] );
  Gemc(ii,2) = min( [ 0 rek(2*ii-1,4) rek(2*ii,4) ] );
  Gemc(ii,3) = max( [ 0 rek(2*ii-1,5) rek(2*ii,5) ] );
  Gemc(ii,4) = min( [ 0 rek(2*ii-1,5) rek(2*ii,5) ] );
  Gemc(ii,5) = max( [ abs(rek(2*ii-1,6)) abs(rek(2*ii,6)) ] );
  Gegc(ii,1) = max( [ 0 rek(2*ii-1,1) rek(2*ii,1) ] );
  Gegc(ii,2) = min( [ 0 rek(2*ii-1,1) rek(2*ii,1) ] );
  Gegc(ii,3) = max( [ 0 rek(2*ii-1,2) rek(2*ii,2) ] );
  Gegc(ii,4) = min( [ 0 rek(2*ii-1,2) rek(2*ii,2) ] );
  Gegc(ii,5) = max( [ abs(rek(2*ii-1,3)) abs(rek(2*ii,3)) ] );

  for jj=1:6
    Gsav(ii,jj) = mean( [ str(2*ii-1,jj) str(2*ii,jj) ] );  
    Geav(ii,jj) = mean( [ rek(2*ii-1,jj) rek(2*ii,jj) ] );  
  end;
end;

for ii=1:(npl-1)
  ils(ii,1) = abs(str(2*ii,1)-str(2*ii+1,1));
  ils(ii,2) = abs(str(2*ii,2)-str(2*ii+1,2));
  ils(ii,3) = abs(str(2*ii,3)-str(2*ii+1,3));
end;

%**********************************************************************
