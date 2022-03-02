%======================================================================
% example 2 ply symmetric laminate
% First the laminate is built by stacking layers.
% The stacking sequence and layer properties is given in the array 'lam'.
% The first row contains the properties of the upper ply.
% Subsequent rows apply to subsequent plies.
% When the upper (z>0) and lower half (z<0) of the laminate are mirrored 
% w.r.t. the midplane (z=0), only the upper plies have to be defined.
% Mirroring is done later automatically according to the value of the
% parameter 'zm': zm=0 -> mirror, zm=1 -> no mirror.

% The values of parameters in 'lam' is defined as follows :
% z-   z+   ang   El    Et    nutl  Gl    al        at        bl   bt
% [mm] [mm] [deg] [Gpa] [GPa] [-]   [GPa] [1e-6K-1] [1e-6K-1] [%]  [%] 

lam = [ 
 0   1   30   100   20   0.3   10     0    0    0    0
-1   0   -30   100   20   0.3   10     0    0    0    0   ];

% The strength of the plies are listed in the arrays 'strb' en 'rekb'.
% 'strb' gives the maximum allowable stresses in the plies.
% 'rekb' gives the maximum allowable strains in the plies.
% Stresses and strains are given in local ply-directions.
% There is a difference between tensile, compression and shear strength.
% 'strb' and 'rekb' may be mirrored later when zm=1.
% The columns of 'strb' contain :
%  sb11+  sb11-  sb22+  sb22-  sb12  [MPa]

strb = 1e6 * [      
10000    -10000  10000   -10000  10000
10000    -10000  10000   -10000  10000];

% The columns of 'rekb' contain :
%  rb11+  rb11-  rb22+  rb22-  rb12  [-]

rekb = [ 
1       -1      1       -1      1
1       -1      1       -1      1];

% A ply fails when stresses or strains exceed their threshold value.
% This limit value is determined with a failure criterion.
% For every ply a different criterion can be used.
% The number of the criterion is given in array 'cr'.
% Again 'cr' may be mirrored later.
% The available criteria are :
%  Tsai-Wu = 1 ; maximmum deformation criterion = 2 

cr   = [1 1]; 

% The character of the damage is indicated in the array 'fm'.
% Initial damage can be introduced.
% The array 'fm' is mirrored later, when indicated by 'zm'..
% Possible damage modes are :
%  0 : no damage
%  1 : matrix failure : ply has stiffness in 1-direction
%  2 : fiber failure  : ply has no stiffness

fm = [0 0]';        

% For 'zm = 1' the input has to be mirrored.
% This can be done in different ways, indicated by 'ls'.
% The actual mirroring is done in the m-file 'mirror.m'.
%  zm=1    : mirror             ;  zm=0    : no mirror
%  ls='sl' : symmetric laminate ;  ls='al' : anti-symmetric laminate

zm   = 0; 
ls   = 'sl';

if zm==1,  mirror; end;

% The laminate may be loaded by :
%  temperature difference, humidity absorption, 
%  forces/moments or strains/curvatures.
% Temperature and humidity loading has to be given per ply.
% ALSO FOR A MIRRORED LAMINATE !!
% Temperature differences are listed in array 'dt'.
% Humidity (%) is given in array 'c'.
% Mechanical loads are given for the complete laminate.
% Mechanical loads are given in array 'ld':
%  Nxx Nyy Nxy Mxx Myy Mxy    [N ; Nm]

dT   = [0 0];
c    = [0 0];
ld   = [100 0 0 0 0 0];

% The laminate is build and analyzed.
% Ply stresses and strains are calculated.
% Type 'help plystr' for definitions.

%======================================================================
