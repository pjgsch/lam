%**********************************************************************
% edit IL4B_con.m   edit IL4B_con.m

clear all; close all;

x0 = [ -45 45 ];

inival = x0;                        % save the initial values 

%======================================================================
% The initial laminate is modelled and analyzes.
% Results are stored and printed later.

ang1 = x0(1); ang2 = x0(2);

IL4B_mod; % tnt1004lammod_2s;

curvature0 = kr(1);

[g0,h0] = IL4B_con(x0);

plotlam; plotstr;

%======================================================================

x0 = inival;

lb = [ -90.0  0.0 ];
ub = [   0.0 90.0 ];

options = optimset('fmincon');
options = optimset(options,'LargeScale','Off');
options = optimset(options,'Display','Iter');
options = optimset(options,'TolX',1e-2,'TolFun',1e-8,'TolCon',1e-8);
global HISTORY
HISTORY.x = [];
HISTORY.fval = [];
options = optimset(options,'outputfcn',@outfun);

[x,fval,exitflag,output,lambda,grad]=...
    fmincon('IL4B_obj',x0,[],[],[],[],lb,ub,'IL4B_con',options);

optval = x;

%======================================================================
% The optimized laminate is analyzed.

x = optval;

ang1 = x(1); ang2 = x(2);
 
IL4B_mod;

curvature = kr(1);

[g,h] = IL4B_con(x);

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
