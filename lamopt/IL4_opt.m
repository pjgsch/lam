%**********************************************************************
% Optimization of a 4-ply symmetric or anti-symmetric laminate.
% Design variables : ply-angles of 1st and 2nd layer.

clear all; %close all;

% Initial values for the design variables

%x0 = [ -65.0 60.0 ];                % no feasable solution
%x0 = [ -80.0 50.0 ];                % no feasable solution
%x0 = [ -10.0 40.0 ];                % good
x0 = [ -20.0 85.0 ];                % good
%x0 = [ -40.0 30.0 ];                % good but not minimum

saveX0 = x0;                        % save the initial values 

%======================================================================
% The initial laminate is modelled and analyzed.
% Results are stored and printed later.

ang1 = x0(1); ang2 = x0(2); 

IL4_mod; % asssizlammod_4;

curvature0 = kr(3);

[g0,h0] = IL4_con(x0);

plotlam; plotstr;

%======================================================================

x0 = saveX0;

lb = [ -90.0  0.0 ];
ub = [   0.0 90.0 ];

options = optimset('fmincon');
global HISTORY
HISTORY.x = [];
HISTORY.fval = [];
options = optimset(options,'outputfcn',@outfun);

[x,fval,exitflag,output,lambda,grad]=...
    fmincon('IL4_obj',x0,[],[],[],[],lb,ub,'IL4_con',options);

saveX = x;                        % save the optimized values 

%======================================================================
% The optimized laminate is analyzed.

ang1 = x(1); ang2 = x(2);
 
IL4_mod;

curvature = kr(3);

[g,h] = IL4_con(x);

plotlam; plotstr;

%======================================================================
% Comparison

fprintf('==========================================================\n')
fprintf('Initial   ply angles   : %8.4f  %8.4f \n',saveX0(1:2));
fprintf('Initial   curvature    : %8.4g \n',curvature0);
fprintf('Initial   constraints  : %8.4f  %8.4f %8.4f  %8.4f %8.4f \n',g0(1:5));
fprintf('                       : %8.4f  %8.4f %8.4f  %8.4f %8.4f \n',g0(6:10));
fprintf('                       : %8.4f  %8.4f %8.4f  \n',g0(11:13));
fprintf('Optimized ply angles   : %8.4f  %8.4f \n',saveX(1:2));
fprintf('Optimized curvature    : %8.4g \n',curvature);
fprintf('Optimized constraints  : %8.4f  %8.4f %8.4f  %8.4f %8.4f \n',g(1:5));
fprintf('                       : %8.4f  %8.4f %8.4f  %8.4f %8.4f \n',g(6:10));
fprintf('                       : %8.4f  %8.4f %8.4f  \n',g(11:13));
fprintf('==========================================================\n')

%HISTORY.x
%HISTORY.fval

%plotlam; plotstr;

%**********************************************************************
