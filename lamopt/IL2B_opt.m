%**********************************************************************
% Optimization of a 2-ply laminate.
% Design variables : the ply-angles in the two plies.

clear all; %close all;

% Initial values for the design variables

%x0 = [ -85.0 75.0 ];
x0 = [ -50.0 80.0 ]; 
%x0 = [ 0.0 0.0 ]; 

X0 = x0;                        % save the initial values 

%======================================================================
% The initial laminate is modelled and analyzed.
% Results are stored and printed later.

ang1 = x0(1); ang2 = x0(2);

IL2B_mod; % excsizlammod_2;

curvature0 = kr(1); 

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

ilsxx0 = ils(1,1);
ilsyy0 = ils(1,2);

[g0,h0] = IL2B_con(x0); 

plotlam; plotstr;

%======================================================================

x0 = X0;

lb = [ -90.0  0.0 ];
ub = [   0.0 90.0 ];

options = optimset('fmincon');
global HISTORY
HISTORY.x = [];
HISTORY.fval = [];
options = optimset(options,'outputfcn',@outfun);

[x,fval,exitflag,output,lambda,grad]=...
    fmincon('IL2B_obj',x0,[],[],[],[],lb,ub,'IL2B_con',options);

X = x;                          % save the optimized values 

%======================================================================
% The optimized laminate is analyzed.

x = X;

ang1 = x(1); ang2 = x(2);
 
IL2B_mod; 

curvature = kr(1);

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

ilsxx = ils(1,1);
ilsyy = ils(1,2);

[g,h] = IL2B_con(x); 

%======================================================================
% Comparison

fprintf('==========================================================\n')
fprintf('Initial   ply angles   : %8.4f  %8.4f \n',X0(1:2));
fprintf('Initial   curvature    : %8.4g \n',curvature0);
fprintf('Initial   ils (xx, yy) : %8.4f  %8.4f \n',ilsxx0,ilsyy0);
fprintf('Initial   Tsai-Hill    : %8.4f  %8.4f \n',TH10,TH20);
fprintf('Initial   constraints  : %8.4f  %8.4f %8.4f  %8.4f \n',g0);
fprintf('Optimized ply angles   : %8.4f  %8.4f \n',X(1:2));
fprintf('Optimized curvature    : %8.4g \n',curvature);
fprintf('Optimized ils (xx, yy) : %8.4f  %8.4f \n',ilsxx,ilsyy);
fprintf('Optimized Tsai-Hill    : %8.4f  %8.4f \n',TH1,TH2);
fprintf('Optimized constraints  : %8.4f  %8.4f %8.4f  %8.4f \n',g);
fprintf('==========================================================\n')

HISTORY.x;
HISTORY.fval;
figure;
plot(HISTORY.x(:,1), HISTORY.x(:,2),'o',HISTORY.x(:,1), HISTORY.x(:,2),'-r')
axis([-90 0 0 90]);

plotlam; plotstr;

%**********************************************************************
