figure; 
surf(Sx1,Sx2,Z4-ones(n1+1,n2+1)); 
xlabel('x1'); ylabel('x2'); zlabel('Z4'); 
title('Damage criterion; ply 4'); 

figure; 
surf(Sx1,Sx2,SGkxy);  
xlabel('x1'); ylabel('x2'); zlabel('\kappa_{xy}'); 
title('objectfunction'); 

figure; 
surf(Sx1,Sx2,Silsxx1/ILSS1-ones(n1+1,n2+1)) 
xlabel('x1'); ylabel('x2'); zlabel('ilsxx1'); 
title('interlaminar shear XX; interface 1'); 
figure; 
surf(Sx1,Sx2,Silsyy1/ILSS1-ones(n1+1,n2+1)) 
xlabel('x1'); ylabel('x2'); zlabel('ilsyy1'); 
title('interlaminar shear YY; interface 1'); 
figure; 
surf(Sx1,Sx2,Silsxy1/ILSS1-ones(n1+1,n2+1)) 
xlabel('x1'); ylabel('x2'); zlabel('ilsxy1'); 
title('interlaminar shear XY; interface 1'); 
figure; 
surf(Sx1,Sx2,Silsxx2/ILSS2-ones(n1+1,n2+1)) 
xlabel('x1'); ylabel('x2'); zlabel('ilsxx2'); 
title('interlaminar shear XX; interface 2'); 
figure; 
surf(Sx1,Sx2,Silsyy2/ILSS2-ones(n1+1,n2+1)) 
xlabel('x1'); ylabel('x2'); zlabel('ilsyy2'); 
title('interlaminar shear YY; interface 2'); 
figure; 
surf(Sx1,Sx2,Silsxy2/ILSS2-ones(n1+1,n2+1)) 
xlabel('x1'); ylabel('x2'); zlabel('ilsxy2'); 
title('interlaminar shear XY; interface 2'); 
figure; 
surf(Sx1,Sx2,Silsxx3/ILSS3-ones(n1+1,n2+1)) 
xlabel('x1'); ylabel('x2'); zlabel('ilsxx3'); 
title('interlaminar shear XX; interface 3'); 
figure; 
surf(Sx1,Sx2,Silsyy3/ILSS3-ones(n1+1,n2+1)) 
xlabel('x1'); ylabel('x2'); zlabel('ilsyy3'); 
title('interlaminar shear YY; interface 3'); 
figure; 
surf(Sx1,Sx2,Silsxy3/ILSS3-ones(n1+1,n2+1)) 
xlabel('x1'); ylabel('x2'); zlabel('ilsxy3'); 
title('interlaminar shear XY; interface 3'); 

figure; 
plcc(Sx1,Sx2,SGkxy.*SGkxy,[],'k');hold on; 
plcc(Sx1,Sx2,Z4,[ 0 0 ],'r');hold on; 
plcc(Sx1,Sx2,Silsxx3/ILSS3,[ 0 0 ],'b');hold on; 
plcc(Sx1,Sx2,Silsyy3/ILSS3,[ 0 0 ],'b');hold on; 
plcc(Sx1,Sx2,Silsxy3/ILSS3,[ 0 0 ],'b');hold on; 
xlabel('x1'); ylabel('x2'); 
grid on;hold off; 
