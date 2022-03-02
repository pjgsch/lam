%**********************************************************************
% 2-ply laminate

% Strengths in Pa

Tl = 1e6; Cl = 0.1e6; Tt = 0.01e6; Ct = 0.05e6; 
SS = 0.02e6; ILSS = 0.05e6;

% Laminate properties :
%  z-  z+   ang    El    Et    Gnlt  Glt   
%  mm  mm   deg    GPa   GPa   -     GPa

lam = [ 
   0   th1   -75   100   20    0.3   10  
  -th2   0    85   100   20    0.3   10 ];

% Loading

ld = [0 100 0 0 0 0];

% The laminate is build and analyzed.

runlam; 

% Results are stored.

Gkxx = kr(1); Gkyy = kr(2); Gkxy = kr(3);

%[ Gsmc Gsgc Gsav Gemc Gegc Geav ils ] = plystr(npl,str,rek);

%[ Gsmc Gsgc ils ] = maxstr(npl,str,rek);
%[ avstr avrek ] = avstrrek(npl,str,rek);

volume = 1000*1000*(th1+th2);

%**********************************************************************
