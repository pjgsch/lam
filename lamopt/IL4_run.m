%**********************************************************************
clear all; close all;

%======================================================================
n1 = 20; n2 = 20;
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

fprintf('i = %3d  j = %3d \r',i,j);

ang2 = ang2+dang2; 

%rsa = 1;                % random laminate 
%rsa = 2;                % symmetric laminate 
rsa = 3;                % anti-symmetric laminate
                
IL4_mod; % asssizlammod_4

Sang1(i,j) = ang1; Sang2(i,j) = ang2;
SGkxx(i,j) = Gkxx; SGkyy(i,j) = Gkyy; SGkxy(i,j) = Gkxy;

SGs11t1(i,j) = Gsmc(1,1);
SGs11t2(i,j) = Gsmc(2,1);
SGs11t3(i,j) = Gsmc(3,1);
SGs11t4(i,j) = Gsmc(4,1);
SGs22t1(i,j) = Gsmc(1,3);
SGs22t2(i,j) = Gsmc(2,3);
SGs22t3(i,j) = Gsmc(3,3);
SGs22t4(i,j) = Gsmc(4,3);
SGs12p1(i,j) = Gsmc(1,5);
SGs12p2(i,j) = Gsmc(2,5);
SGs12p3(i,j) = Gsmc(3,5);
SGs12p4(i,j) = Gsmc(4,5);

Silsxx1(i,j) = ils(1,1);
Silsxx2(i,j) = ils(2,1);
Silsxx3(i,j) = ils(3,1);
Silsyy1(i,j) = ils(1,2);
Silsyy2(i,j) = ils(2,2);
Silsyy3(i,j) = ils(3,2);
Silsxy1(i,j) = ils(1,3);
Silsxy2(i,j) = ils(2,3);
Silsxy3(i,j) = ils(3,3);

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
Z3 = ...
( (SGs11t3.*SGs11t3)/(Tl*Tl) ) - ...
( (SGs11t3.*SGs22t3)/(Tl*Tl) ) + ...
( (SGs22t3.*SGs22t3)/(Tt*Tt) ) + ...
( (SGs12p3.*SGs12p3)/(SS*SS) );
Z4 = ...
( (SGs11t4.*SGs11t4)/(Tl*Tl) ) - ...
( (SGs11t4.*SGs22t4)/(Tl*Tl) ) + ...
( (SGs22t4.*SGs22t4)/(Tt*Tt) ) + ...
( (SGs12p4.*SGs12p4)/(SS*SS) );

figure;
surf(Sang1,Sang2,SGkxy); 
xlabel('ang1'); ylabel('ang2'); zlabel('\kappa_{xy}');
run('/home/piet/work/mlf/mbib/chp');
print('-depsc2','/home/piet/wdoc/tex/syl/dnt/fig/asssizlamrunsolkxy');

figure;
surf(Sang1,Sang2,Silsxx1/ILSS-ones(n1+1,n2+1));
xlabel('ang1'); ylabel('ang2'); zlabel('ilsxx1');

figure;
surf(Sang1,Sang2,Silsyy1/ILSS-ones(n1+1,n2+1));
xlabel('ang1'); ylabel('ang2'); zlabel('ilsyy1');

figure;
plcc(Sang1,Sang2,SGkxy,[],'k');hold on;
plcc(Sang1,Sang2,Z1,[ 0 0 ],'r');hold on;
plcc(Sang1,Sang2,Z2,[ 0 0 ],'r');hold on;
plcc(Sang1,Sang2,Z3,[ 0 0 ],'r');hold on;
plcc(Sang1,Sang2,Z4,[ 0 0 ],'r');hold on;
plcc(Sang1,Sang2,Silsxx1/ILSS,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,Silsxx2/ILSS,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,Silsxx3/ILSS,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,Silsyy1/ILSS,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,Silsyy2/ILSS,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,Silsyy3/ILSS,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,Silsxy1/ILSS,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,Silsxy2/ILSS,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,Silsxy3/ILSS,[ 0 0 ],'b');hold on;
xlabel('ang1'); ylabel('ang2');
grid on;hold off;
%run('/home/piet/work/mlf/mbib/chp');
%print('-depsc2','/home/piet/wdoc/tex/syl/dnt/fig/asssizlamrunsolcpl');

%**********************************************************************
