%**********************************************************************
% function plsss(Sx1,Sx2,SM,c,va);
%
% 3D-plot of objective function.
%
% Sx1  :  design variable 1
% Sx2  :  design variable 2
% SM   :  objective function array 
% c    :  column in objective function array
% va   :  view angle
%**********************************************************************

function plsss(Sx1,Sx2,SM,c,va);

va1 = va(1); va2 = va(2);

[nd,n1,n2] = size(SM);

  for j=1:1:n1
    for k=1:1:n2
      CM(j,k) = SM(c,j,k);
    end;
  end;

surf(Sx1,Sx2,CM'); view(va1,va2);

%**********************************************************************
