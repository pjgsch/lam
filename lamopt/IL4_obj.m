%**********************************************************************

function f = IL4_obj(x);

% Design variables

ang1 = x(1);        % ply-angle ply 1
ang2 = x(2);        % ply-angle ply 2

IL4_mod; % asssizlammod_4;

% The objective function is the curvature Gkxx.
% The quadrature is taken because Gkxx can be negative.
% The objective function is scaled to have a valeu around 1.

f = Gkxy*Gkxy * 1e8;

%**********************************************************************
