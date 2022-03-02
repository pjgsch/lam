%**********************************************************************
% edit IL4C_con.m   edit IL4C_con.m

clear all; close all;

x0 = [ -5 5 ];

inival = x0;                        % save the initial values 

%======================================================================
% The initial laminate is modelled and analyzes.
% Results are stored and printed later.

ang1 = x0(1); ang2 = x0(2);

IL4C_mod; % tntlammod_2s;

curvature0 = kr(1);

[g0,h0] = IL4C_con(x0);

plotlam; plotstr;

%======================================================================

x0 = inival;

lb = [ -90.0  0.0 ];
ub = [   0.0 90.0 ];

options = optimset('fmincon');
global HISTORY
HISTORY.x = [];
HISTORY.fval = [];
options = optimset(options,'outputfcn',@outfun);

[x,fval,exitflag,output,lambda,grad]=...
    fmincon('IL4C_obj',x0,[],[],[],[],lb,ub,'IL4C_con',options);

optval = x;


%======================================================================
% The optimized laminate is analyzed.

x = optval;

ang1 = x(1); ang2 = x(2);
 
IL4C_mod; % tntlammod_2s;

curvature = kr(1);

[g,h] = IL4C_con(x);

plotlam; plotstr;

%======================================================================
% Comparison

fprintf('==========================================================\n')
fprintf('Initial   ply angles   : %8.4f  %8.4f \n',inival(1:2));
fprintf('Initial   curvature    : %8.4g \n',curvature0);
fprintf('Initial   constraints  : %8.4f  %8.4f %8.4f  %8.4f \n',g0(1:4));
fprintf('Optimized ply angles   : %8.4f  %8.4f \n',optval(1:2));
fprintf('Optimized curvature    : %8.4g \n',curvature);
fprintf('Optimized constraints  : %8.4f  %8.4f %8.4f  %8.4f \n',g(1:4));
fprintf('==========================================================\n')

%HISTORY.x
%HISTORY.fval

%**********************************************************************
