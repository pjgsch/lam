%**********************************************************************
% Anisotropic plate.

%----------------------------------------------------------------------
% Parameters

th1   = 1; 
ang1  = 30;
th2   = 1;
ang2  = 30;

El    = 100; 
Et    = 20;
Gnlt  = 0.25;
Gntt  = 0.4;			% not used in LAM
Glt   = 10;
Gtt = Et/(2*(1+Gntt));		% not used in LAM

Nxx = 100; 
Nyy = 0; 
Nxy = 0; 
Mxx = 570;			% this is 'Myy' in MARC
Myy = 0;			% this is 'Mxx' in MARC
Mxy = 0;

%----------------------------------------------------------------------

% Laminate properties :
% z-  z+   ang    El    Et    Gnlt  Glt   
% mm  mm   deg    GPa   GPa   -     GPa

lam = [ 
   0     th1   ang1   El   Et   Gnlt  Glt  
   -th2  0     ang2   El   Et   Gnlt  Glt ];

% Loading

ld = [Nxx Nyy Nxy Mxx Myy Mxy];


%**********************************************************************
