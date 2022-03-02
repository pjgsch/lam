%**********************************************************************
% symmetric 4-ply laminate

% Properties; thickness in mm, stiffness in GPa

th1 = 0.5; El1 = 100; Et1 = 20; Gnlt1 = 0.3; Glt1 = 10;
th2 = 1.0; El2 = 100; Et2 = 20; Gnlt2 = 0.3; Glt2 = 10;

% Maximum transversal stress in Pa

GSmax = 10e6;

% Stacking

lam = [
 th2 th2+th1 ang1 El1 Et1 Gnlt1 Glt1 
 0   th2     ang2 El2 Et2 Gnlt2 Glt2  ];

zm = 1; ls = 'sl'; 

%ld = [ 0 0 0  0 100 0 ];
ld = [ 0 0 0  0 0 100 ];

runlam;

%**********************************************************************
