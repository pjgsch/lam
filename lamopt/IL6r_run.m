%**********************************************************************
clear all; close all;

%======================================================================
% design variable 1

n1 = 19; 
x1L = 0; x1U = 90; dx1 = (x1U-x1L)/n1;

% design variable 2

n2 = 19;
x2L = 0; x2U = 90; dx2 = (x2U-x2L)/n2;

%======================================================================

x1 = x1L - dx1;

for i1 = 1:n1+1
%----------------------------------------------------------------------
x2 = x2L - dx2;
x1 = x1 + dx1; 

for i2 = 1:n2+1
%----------------------------------------------------------------------

fprintf('i1 = %3d  i2 = %3d \r ',i1,i2);

x2 = x2 + dx2;

%----------------------------------------------------------------------

IL6r_val; % asslamval_6r;
ang1 = x1; ang6 = x2;

IL6r_mod; % asslammod_6r;

%----------------------------------------------------------------------

Sx1(i1,i2) = x1; Sx2(i1,i2) = x2;

lamSRC;

%----------------------------------------------------------------------
end;
%----------------------------------------------------------------------
end;

lamSRD;

%======================================================================

figure;
surf(Sx1,Sx2,SGkxy.*SGkxy); 
xlabel('x1'); ylabel('x2'); zlabel('\kappa_{xy}');

figure;
surf(Sx1,Sx2,Silsxx1/ILSS1-ones(n1+1,n2+1))
hold on;
surf(Sx1,Sx2,Silsyy1/ILSS1-ones(n1+1,n2+1));
surf(Sx1,Sx2,Silsxy1/ILSS1-ones(n1+1,n2+1));
xlabel('x1'); ylabel('x2'); zlabel('ils');

figure;
surf(Sx1,Sx2,Silsxx2/ILSS2-ones(n1+1,n2+1))
hold on;
surf(Sx1,Sx2,Silsyy2/ILSS2-ones(n1+1,n2+1));
surf(Sx1,Sx2,Silsxy2/ILSS2-ones(n1+1,n2+1));
xlabel('x1'); ylabel('x2'); zlabel('ils');

figure;
surf(Sx1,Sx2,Silsxx3/ILSS3-ones(n1+1,n2+1))
hold on;
surf(Sx1,Sx2,Silsyy3/ILSS3-ones(n1+1,n2+1));
surf(Sx1,Sx2,Silsxy3/ILSS3-ones(n1+1,n2+1));
xlabel('x1'); ylabel('x2'); zlabel('ils');

figure;
surf(Sx1,Sx2,Silsxx4/ILSS4-ones(n1+1,n2+1))
hold on;
surf(Sx1,Sx2,Silsyy4/ILSS4-ones(n1+1,n2+1));
surf(Sx1,Sx2,Silsxy4/ILSS4-ones(n1+1,n2+1));
xlabel('x1'); ylabel('x2'); zlabel('ils');

figure;
surf(Sx1,Sx2,Silsxx5/ILSS5-ones(n1+1,n2+1))
hold on;
surf(Sx1,Sx2,Silsyy5/ILSS5-ones(n1+1,n2+1));
surf(Sx1,Sx2,Silsxy5/ILSS5-ones(n1+1,n2+1));
xlabel('x1'); ylabel('x2'); zlabel('ils');

figure;
plcc(Sx1,Sx2,SGkxy.*SGkxy,[],'k');hold on;
plcc(Sx1,Sx2,Z1,[ 0 0 ],'r');hold on;
plcc(Sx1,Sx2,Z2,[ 0 0 ],'r');hold on;
plcc(Sx1,Sx2,Z3,[ 0 0 ],'r');hold on;
plcc(Sx1,Sx2,Z4,[ 0 0 ],'r');hold on;
plcc(Sx1,Sx2,Z5,[ 0 0 ],'r');hold on;
plcc(Sx1,Sx2,Z6,[ 0 0 ],'r');hold on;
plcc(Sx1,Sx2,Silsxx1/ILSS1,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsxx2/ILSS2,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsxx3/ILSS3,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsxx4/ILSS4,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsxx5/ILSS5,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsyy1/ILSS1,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsyy2/ILSS2,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsyy3/ILSS3,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsyy4/ILSS4,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsyy5/ILSS5,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsxy1/ILSS1,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsxy2/ILSS2,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsxy3/ILSS3,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsxy4/ILSS4,[ 0 0 ],'b');hold on;
plcc(Sx1,Sx2,Silsxy5/ILSS5,[ 0 0 ],'b');hold on;
xlabel('x1'); ylabel('x2');
grid on;hold off;

%**********************************************************************
