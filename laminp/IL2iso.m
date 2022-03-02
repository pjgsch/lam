%**********************************************************************
% Isotropic plate.

%----------------------------------------------------------------------
% Parameters

Thick = 2;                      % thickness in [mm]
Emod  = 100;                    % Young's modulus in [GPa]
Pois  = 0.25;                   % Poisson's ratio

% Boundary loads in [N] and [Nm]

Nxx = 0; 
Nyy = 0; 
Nxy = 0;                        
Mxx = 100;			% this is 'Myy' in MARC
Myy = 0;			% this is 'Mxx' in MARC
Mxy = 0;

%----------------------------------------------------------------------
% The laminate is an isotropic plate, so the only material parameters
% are Young's modulus and Poisson's ratio.

ang = 0; El = Emod; Et = Emod; Gnlt = Pois; Glt = Emod/(2*(1+Pois));

% Laminate properties :
% z-  z+   ang    El    Et    Gnlt  Glt   
% mm  mm   deg    GPa   GPa   -     GPa

lam = [ 
   0         Thick/2   ang   El   Et   Gnlt  Glt  
  -Thick/2   0         ang   El   Et   Gnlt  Glt ];

% Loading

ld = [Nxx Nyy Nxy Mxx Myy Mxy];

%**********************************************************************
