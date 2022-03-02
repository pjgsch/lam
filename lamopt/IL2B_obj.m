%**********************************************************************

function f = IL2B_obj(x);

% Design variables

ang1 = x(1);       % ply-angle ply 1
ang2 = x(2);       % ply-angle ply 2

IL2B_mod;

% The objective function is the curvature Gkxx.
% The quadrature is taken because Gkxx can be negative.
% The objective function is scaled to have a valeu around 1.

f = Gkxx*Gkxx * 1e8;

%**********************************************************************
