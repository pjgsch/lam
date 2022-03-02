%**********************************************************************

npl = 6;

b1 =  2; t1 =  3; ang1 =  90; El1 = 150; Et1 = 30; Gnlt1 = 0.4; Glt1 = 30;
b2 =  1; t2 =  2; ang2 =  45; El2 = 100; Et2 = 20; Gnlt2 = 0.3; Glt2 = 20;
b3 =  0; t3 =  1; ang3 =  30; El3 =  75; Et3 = 10; Gnlt3 = 0.2; Glt3 = 10;
b4 = -1; t4 =  0; ang4 = -30; El4 =  75; Et4 = 10; Gnlt4 = 0.2; Glt4 = 10;
b5 = -2; t5 = -1; ang5 =  45; El5 = 100; Et5 = 20; Gnlt5 = 0.3; Glt5 = 20;
b6 = -3; t6 = -2; ang6 =  90; El6 = 150; Et6 = 30; Gnlt6 = 0.4; Glt6 = 30;

Tl1 = 1070e6; Cl1 = 91e6; Tt1 = 8e6; Ct1 = 44e6; SS1 = 15e6; 
Tl2 = 1070e6; Cl2 = 91e6; Tt2 = 8e6; Ct2 = 44e6; SS2 = 15e6; 
Tl3 = 1070e6; Cl3 = 91e6; Tt3 = 8e6; Ct3 = 44e6; SS3 = 15e6; 
Tl4 = 1070e6; Cl4 = 91e6; Tt4 = 8e6; Ct4 = 44e6; SS4 = 15e6; 
Tl5 = 1070e6; Cl5 = 91e6; Tt5 = 8e6; Ct5 = 44e6; SS5 = 15e6; 
Tl6 = 1070e6; Cl6 = 91e6; Tt6 = 8e6; Ct6 = 44e6; SS6 = 15e6; 

ILSS1 = 2e4;
ILSS2 = 2e4;
ILSS3 = 2e4;
ILSS4 = 2e4;
ILSS5 = 2e4;

plystresses = [ 1 0 1 0 1 ];
plyintlamsh = [ 1 1 1 1 1 ];

objectfunvar1 = 'SGkxy';
objectfunvar2 = 'SGkxy.*SGkxy';
objectfunstr  = '\kappa_{xy}';


%**********************************************************************
