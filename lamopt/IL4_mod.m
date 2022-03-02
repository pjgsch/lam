%**********************************************************************
% 4-ply laminate : plasma treated HPPE / epoxy ; V_f = 0.5

% Strengths in Pa

Tl = 1070e6; Cl = 91e6; Tt = 8e6; Ct = 44e6; 
SS = 15e6; ILSS = 30e6;

rsa = 3;

% Laminate properties :
% z-  z+   ang    El    Et    Gnlt  Glt   
% mm  mm   deg    GPa   GPa   -     GPa

%----------------------------------------------------------------------

if rsa==1                        % random laminate (rl)
lam  = [ 
   1   2   ang1   49    3.2   0.3   1.0 
   0   1   ang2   49    3.2   0.3   1.0 
  -1   0   ang3   49    3.2   0.3   1.0 
  -2  -1   ang4   49    3.2   0.3   1.0  ];

elseif rsa==2                    % symmetric laminate (sl)
lam  = [
   1   2   ang1   49    3.2   0.3   1.0 
   0   1   ang2   49    3.2   0.3   1.0  ];
zm = 1; ls = 'sl'; 

elseif rsa==3                    % anti-symmetric laminate (al)
lam  = [
   1   2   ang1   49    3.2   0.3   1.0  
   0   1   ang2   49    3.2   0.3   1.0  ];
zm = 1; ls = 'al'; 

end;

%----------------------------------------------------------------------

% Loading

ld   = [100000 0 0 0 0 0];
%ld   = [0 0 0 100 0 0];

% The laminate is build and analyzed.

runlam; 

% Results are extracted.

Gkxx = kr(1); Gkyy = kr(2); Gkxy = kr(3);

%[ Gsmc Gsgc Gsav Gemc Gegc Geav ils ] = plystr(npl,str,rek);

%**********************************************************************
