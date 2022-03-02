%**********************************************************************
% Optimization of a 2-ply laminate.
% Design variables : ply angles in the two plies.

clear all; close all;

% Initial values for the design variables

x0 = [ 1 1 ];

X0 = x0;                        % save the initial values 

%======================================================================
% The initial laminate is modelled and analyzed.
% Results are stored and printed later.

th1 = x0(1); th2 = x0(2);

IL2C_mod;

f = IL2C_obj(x0); volume0 = f;

curvature0 = kr(3);

Gs11t1 = Gsmc(1,1);
Gs11t2 = Gsmc(2,1);
Gs22t1 = Gsmc(1,3);
Gs22t2 = Gsmc(2,3);
Gs12p1 = Gsmc(1,5);
Gs12p2 = Gsmc(2,5);

TH10 = ...
( (Gs11t1*Gs11t1)/(Tl*Tl) ) - ...
( (Gs11t1*Gs22t1)/(Tl*Tl) ) + ...
( (Gs22t1*Gs22t1)/(Tt*Tt) ) + ...
( (Gs12p1*Gs12p1)/(SS*SS) ) ;

TH20 = ...
( (Gs11t2*Gs11t2)/(Tl*Tl) ) - ...
( (Gs11t2*Gs22t2)/(Tl*Tl) ) + ...
( (Gs22t2*Gs22t2)/(Tt*Tt) ) + ...
( (Gs12p2*Gs12p2)/(SS*SS) ) ;

[g0,h0] = IL2C_con(x0); 

plotlam; plotstr;

%======================================================================

x0 = X0;

% Lower and upper bound for the thicknesses

lb = [ 0.25 0.25 ];
ub = [ 2.00 2.00 ];

% Optimization starts

options = optimset('fmincon');
global HISTORY
HISTORY.x = [];
HISTORY.fval = [];
options = optimset(options,'outputfcn',@outfun);

[x,fval,exitflag,output,lambda,grad]=...
    fmincon('IL2C_obj',x0,[],[],[],[],lb,ub,'IL2C_con',options);

X = x;                          % save the optimized values 

%======================================================================
% The optimized laminate is analyzed.

x = X;

th1 = x(1); th2 = x(2);

IL2C_mod;

f = IL2C_obj(x); volume = f;

curvature = kr(3);

Gs11t1 = Gsmc(1,1);
Gs11t2 = Gsmc(2,1);
Gs22t1 = Gsmc(1,3);
Gs22t2 = Gsmc(2,3);
Gs12p1 = Gsmc(1,5);
Gs12p2 = Gsmc(2,5);

TH1 = ...
( (Gs11t1*Gs11t1)/(Tl*Tl) ) - ...
( (Gs11t1*Gs22t1)/(Tl*Tl) ) + ...
( (Gs22t1*Gs22t1)/(Tt*Tt) ) + ...
( (Gs12p1*Gs12p1)/(SS*SS) ) ;

TH2 = ...
( (Gs11t2*Gs11t2)/(Tl*Tl) ) - ...
( (Gs11t2*Gs22t2)/(Tl*Tl) ) + ...
( (Gs22t2*Gs22t2)/(Tt*Tt) ) + ...
( (Gs12p2*Gs12p2)/(SS*SS) ) ;

[g,h] = IL2C_con(x); 

%======================================================================
% Comparison

fprintf('==========================================================\n')
fprintf('Initial   thicknesses  : %8.4f  %8.4f \n',X0(1:2));
fprintf('Initial   volume       : %8.4f  \n',volume0)
fprintf('Initial   curvature    : %8.4g \n',curvature0);
fprintf('Initial   Tsai-Hill    : %8.4f  %8.4f \n',TH10,TH20);
fprintf('Initial   constraints  : %8.4f  %8.4f %8.4f  \n',g0);
fprintf('Optimized thicknesses  : %8.4f  %8.4f \n',X(1:2));
fprintf('Optimized volume       : %8.4f  \n',volume)
fprintf('Optimized curvature    : %8.4g \n',curvature);
fprintf('Optimized Tsai-Hill    : %8.4f  %8.4f \n',TH1,TH2);
fprintf('Optimized constraints  : %8.4f  %8.4f %8.4f  \n',g);
fprintf('==========================================================\n')

HISTORY.x;
HISTORY.fval;

plotlam; plotstr;

%**********************************************************************
