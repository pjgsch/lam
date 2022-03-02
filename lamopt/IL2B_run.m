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

fprintf('i = %3d  j = %3d \r ',i,j);

ang2 = ang2+dang2; 

IL2B_mod;%excsizlammod_2;
Sang1(i,j) = ang1; Sang2(i,j) = ang2;
SGkxx(i,j) = Gkxx; SGkyy(i,j) = Gkyy; SGkxy(i,j) = Gkxy;

SGs11t1(i,j) = Gsmc(1,1);
SGs11t2(i,j) = Gsmc(2,1);
SGs22t1(i,j) = Gsmc(1,3);
SGs22t2(i,j) = Gsmc(2,3);
SGs12p1(i,j) = Gsmc(1,5);
SGs12p2(i,j) = Gsmc(2,5);

Silsxx1(i,j) = ils(1,1);
Silsyy1(i,j) = ils(1,2);

%----------------------------------------------------------------------
end;
%----------------------------------------------------------------------
end;

Z1 = ...
( (SGs11t1.*SGs11t1)/(Tl*Tl) ) - ...
( (SGs11t1.*SGs22t1)/(Tl*Tl) ) + ...
( (SGs22t1.*SGs22t1)/(Tt*Tt) ) + ...
( (SGs12p1.*SGs12p1)/(SS*SS) );
Z2 = ...
( (SGs11t2.*SGs11t2)/(Tl*Tl) ) - ...
( (SGs11t2.*SGs22t2)/(Tl*Tl) ) + ...
( (SGs22t2.*SGs22t2)/(Tt*Tt) ) + ...
( (SGs12p2.*SGs12p2)/(SS*SS) );


figure;
surf(Sang1,Sang2,SGkxx.^2);
xlabel('ang1'); ylabel('ang2'); zlabel('\kappa_{xx}^2');

figure;
surf(Sang1,Sang2,Silsxx1/ILSS-ones(n1+1,n2+1));
xlabel('ang1'); ylabel('ang2'); zlabel('ilsxx');

figure;
surf(Sang1,Sang2,Silsyy1/ILSS-ones(n1+1,n2+1));
xlabel('ang1'); ylabel('ang2'); zlabel('ilsyy');

figure;
surf(Sang1,Sang2,Z1-ones(n1+1,n2+1));
xlabel('ang1'); ylabel('ang2'); zlabel('TH1');

figure;
surf(Sang1,Sang2,Z2-ones(n1+1,n2+1));
xlabel('ang1'); ylabel('ang2'); zlabel('TH2');

figure;
plcc(Sang1,Sang2,SGkxx.^2,[],'k'); hold on;
plcc(Sang1,Sang2,Z1,[0 0],'r'); hold on;
plcc(Sang1,Sang2,Z2,[0 0],'r'); hold on;
plcc(Sang1,Sang2,Silsxx1/ILSS,[0 0],'b'); hold on;
plcc(Sang1,Sang2,Silsyy1/ILSS,[0 0],'b'); hold on;
xlabel('ang1'); ylabel('ang2');
grid on;hold off;

%**********************************************************************
