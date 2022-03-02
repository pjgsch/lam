%**********************************************************************
% Calculate "exact solution" (Roark)
% u = upper; b = bottom
% tu,tb : ply thickness; Eu,Eb : Young's modulus
% t = ply temperature (uniform !)
% t0 = reference temperature
% alfb,alfu : coeff.of.therm.expamsion
% su,sb = stress in extreme fibers

tu = 1; tb = 1; Eu = 100; Eb = 100;
% Eu en Eb in MPa !
t = 100; t0 = 0; alfu = 1; alfb = 0.5;

a = tu/tb; ai = tb/tu; b = Eu/Eb; bi = Eb/Eu;
k1 = 4 + 6*a + 4*a*a + b*a*a*a + bi*ai;
dalf = alfb - alfu ; delt = t - t0;
fu = - dalf*delt*Eu/k1 ; fb = dalf*delt*Eb/k1;

su = fu*(3*a + 2*a*a - bi*ai); sb = fb*(3*a + 2 - b*a*a*a);

% z-[mm] z+ ang[deg] El[Gpa] Et nutl[-] Gl[GPa] al[1e-6K-1] at bl[%] bt
lam = [
 0     tu    0   Eu/1000   Eu/1000   0   Eu/2000   alfu   0     0      0      
-tb     0    0   Eb/1000   Eb/1000   0   Eb/2000   alfb   0     0      0      
];

%  sb11+  sb11-  sb22+  sb22-  sb12  [MPa]
strb = 1e6 * [
100      -100    50      -50     50
100      -100    50      -50     50
];

%  rb11+  rb11-  rb22+  rb22-  rb12  [-]
rekb = [
0.01    -0.01   0.01    -0.01   0.01
0.01    -0.01   0.01    -0.01   0.01
];

%  Tsai-Wu = 1 ; maximaal vervormingscriterium = 2 
cr = [1 1]; 

% niet bezweken : 0;  matrix bezweken : 1; vezel bezweken : 2
fm = [0 0]';

zm   = 0; 
ls  = 'sl'; 
if zm==1,  mirror; end;

dT = [t t] ;
c  = [0 0] ;

%  Nxx Nyy Nxy Mxx Myy Mxy    [N ; Nm]
ld = [0 0 0 0 0 0];

%**********************************************************************
