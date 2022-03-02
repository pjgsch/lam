%**********************************************************************
clear all; close all;

%======================================================================
n1 = 20; n2 = 20;

ang10 =   0; ang20 =  0;
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

IL4B_mod; % tnt1004lammod_2s;

Sang1(i,j) = ang1; Sang2(i,j) = ang2;
SGkxx(i,j) = kr(1); 

SGs22t1(i,j) = Gsmc(1,3);
SGs22t2(i,j) = Gsmc(2,3);
SGs22t3(i,j) = Gsmc(3,3);
SGs22t4(i,j) = Gsmc(4,3);

%----------------------------------------------------------------------
end;
%----------------------------------------------------------------------
end;

figure;
surf(Sang1,Sang2,SGkxx); 
xlabel('ang1'); ylabel('ang2'); zlabel('\kappa_{xx}');

%figure;
%surf(Sang1,Sang2,SGs22t1/GSmax-ones(n1+1,n2+1));
%xlabel('ang1'); ylabel('ang2'); zlabel('Gs11 in ply 1');

figure;
plcc(Sang1,Sang2,SGkxx,[],'k');hold on;
plcc(Sang1,Sang2,SGs22t1/GSmax,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,SGs22t2/GSmax,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,SGs22t3/GSmax,[ 0 0 ],'b');hold on;
plcc(Sang1,Sang2,SGs22t4/GSmax,[ 0 0 ],'b');hold on;
xlabel('ang1'); ylabel('ang2');
grid on;hold off;


%**********************************************************************
