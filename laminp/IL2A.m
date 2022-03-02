%======================================================================
% Simple example of 2-ply laminate
%
clear all; close all;

% Laminate properties
% z-  z+   ang    El    Et    Gnlt  Glt   
% mm  mm   deg    GPa   GPa   -     GPa

lam = [ 
   0    1   30    100   20   0.3   10  0 0 0 0
  -1    0   30    100   20   0.3   10  0 0 0 0 ];

% Mirror (zm=1) or not (zm=0).
% When mirror is required, we have to specify whether the laminate
% is symmetric (ls='sl') or anti-symmetric (ls='al').

zm = 0;
ls = 'sl';

% The edge load in [N] and [Nm].
% ld = [ Nxx Nyy Nxy Mxx Myy Mxy ];

ld = [0 0 0 100 0 0];

%======================================================================
