%**********************************************************************

function f = IL2C_obj(x);

% Design variables

th1 = x(1);      % thickness of ply 1
th2 = x(2);      % thickness of ply 2

IL2C_mod;

% The objective function is the volume of the laminate.
% The virtual in plane dimensions are 1000 x 1000 mm.
% Units for volume are in mm^3.

f = volume * 1e-6;

%**********************************************************************
