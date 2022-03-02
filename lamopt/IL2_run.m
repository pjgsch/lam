%**********************************************************************
clear all; close all;  

%======================================================================
n1 = 50; n2 = 50;
ang10 = 0; ang20 = 0;
ang1m = -90; ang2m = 90;

%======================================================================

dang1=(ang1m-ang10)/n1; dang2=(ang2m-ang20)/n2;

ang1=ang10-dang1;

for i=1:n1+1
%----------------------------------------------------------------------

ang1 = ang1+dang1;  ang2 = ang20-dang2;

for j=1:n2+1
%----------------------------------------------------------------------

ang2 = ang2+dang2; 

IL2_mod;

Sang1(i,j) = ang1; Sang2(i,j) = ang2;
SGkxx(i,j) = Gkxx; SGkyy(i,j) = Gkyy; SGkxy(i,j) = Gkxy;

SGs11t1(i,j) = Gs11t(1);
SGs11t2(i,j) = Gs11t(2);
SGs22t1(i,j) = Gs22t(1);
SGs22t2(i,j) = Gs22t(2);
SGs12p1(i,j) = Gs12(1);
SGs12p2(i,j) = Gs12(2);

Silsxx1(i,j) = ilsxx(1);
Silsyy1(i,j) = ilsyy(1);

%----------------------------------------------------------------------
end;
%----------------------------------------------------------------------
end;

Z1 = ...
( (SGs11t1.*SGs11t1)/(Tl*Tl) ) - ...
( (SGs11t1.*SGs22t1)/(Tl*Tl) ) + ...
( (SGs22t1.*SGs22t1)/(Tt*Tt) ) + ...
( (SGs12p1.*SGs12p1)/(SS*SS) ) - ...
ones(n1+1,n2+1);
Z2 = ...
( (SGs11t2.*SGs11t2)/(Tl*Tl) ) - ...
( (SGs11t2.*SGs22t2)/(Tl*Tl) ) + ...
( (SGs22t2.*SGs22t2)/(Tt*Tt) ) + ...
( (SGs12p2.*SGs12p2)/(SS*SS) ) - ...
ones(n1+1,n2+1);

figure;
dc=0.1:0.05:1.0;
contour(Sang1,Sang2,SGkxx.^2,'k');hold on;

contour(Sang1,Sang2,Z1,[ 0 0 ],'r');
contour(Sang1,Sang2,Z1,dc,'r:');
contour(Sang1,Sang2,Z2,[ 0 0 ],'r');
contour(Sang1,Sang2,Z2,dc,'r:');

contour(Sang1,Sang2,Silsxx1/ILSS-ones(n1+1,n2+1),[ 0 0 ],'b');
contour(Sang1,Sang2,Silsxx1/ILSS-ones(n1+1,n2+1),dc,'b:');
contour(Sang1,Sang2,Silsyy1/ILSS-ones(n1+1,n2+1),[ 0 0 ],'b');
contour(Sang1,Sang2,Silsyy1/ILSS-ones(n1+1,n2+1),dc,'b:');
grid on;hold off;

figure;
surf(Sang1,Sang2,SGkxx.^2);
xlabel('ang1'); ylabel('ang2'); zlabel('\kappa_{xx}');
figure;
surf(Sang1,Sang2,Silsxx1/ILSS-ones(n1+1,n2+1));
xlabel('ang1'); ylabel('ang2'); zlabel('ilsxx1');
figure;
surf(Sang1,Sang2,Silsyy1/ILSS-ones(n1+1,n2+1));
xlabel('ang1'); ylabel('ang2'); zlabel('ilsyy1');

%**********************************************************************
