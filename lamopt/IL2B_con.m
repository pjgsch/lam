%**********************************************************************

function [g,h] = IL2B_con(x);

%----------------------------------------------------------------------
% Design variables

ang1 = x(1);
ang2 = x(2);

%----------------------------------------------------------------------
% 

IL2B_mod; % excsizlammod_2;

Gs11t1 = Gsmc(1,1);
Gs11t2 = Gsmc(2,1);
Gs22t1 = Gsmc(1,3);
Gs22t2 = Gsmc(2,3);
Gs12p1 = Gsmc(1,5);
Gs12p2 = Gsmc(2,5);

%----------------------------------------------------------------------
% Inequality constraints

g(1) = ...
( (Gs11t1*Gs11t1)/(Tl*Tl) ) - ...
( (Gs11t1*Gs22t1)/(Tl*Tl) ) + ...
( (Gs22t1*Gs22t1)/(Tt*Tt) ) + ...
( (Gs12p1*Gs12p1)/(SS*SS) ) - ...
1;
g(2) = ...
( (Gs11t2*Gs11t2)/(Tl*Tl) ) - ...
( (Gs11t2*Gs22t2)/(Tl*Tl) ) + ...
( (Gs22t2*Gs22t2)/(Tt*Tt) ) + ...
( (Gs12p2*Gs12p2)/(SS*SS) ) - ...
1;

g(3) = ils(1,1)/ILSS - 1;
g(4) = ils(1,2)/ILSS - 1;

%----------------------------------------------------------------------
% Equality constraints

h = [];

%**********************************************************************
