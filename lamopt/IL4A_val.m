%**********************************************************************

npl = 4;

b1 =  1; t1 =  2; ang1 =  30; El1 = 49; Et1 = 3.2; Gnlt1 = 0.3; Glt1 = 1;
b2 =  0; t2 =  1; ang2 = -45; El2 = 49; Et2 = 3.2; Gnlt2 = 0.2; Glt2 = 1;
b3 = -1; t3 =  0; ang3 = -45; El3 = 49; Et3 = 3.2; Gnlt3 = 0.2; Glt3 = 1;
b4 = -2; t4 = -1; ang4 =  30; El4 = 49; Et4 = 3.2; Gnlt4 = 0.3; Glt4 = 1;

Nxx = 0;
Nyy = 0;
Nxy = 0;
Mxx = 50;
Myy = 50;
Mxy = 0;

Tl1 = 1070e6; Cl1 = 91e6; Tt1 = 8e6; Ct1 = 44e6; SS1 = 15e6; 
Tl2 = 1070e6; Cl2 = 91e6; Tt2 = 8e6; Ct2 = 44e6; SS2 = 15e6; 
Tl3 = 1070e6; Cl3 = 91e6; Tt3 = 8e6; Ct3 = 44e6; SS3 = 15e6; 
Tl4 = 1070e6; Cl4 = 91e6; Tt4 = 8e6; Ct4 = 44e6; SS4 = 15e6; 

ILSS1 = 30e6;
ILSS2 = 30e6;
ILSS3 = 30e6;

plystresses = [ 1 0 1 0 1 ];
plyintlamsh = [ 1 1 1 ];

objectfunvar1 = 'SGkxy';
objectfunvar2 = 'SGkxy.*SGkxy';
objectfunstr  = '\kappa_{xy}';

%**********************************************************************
