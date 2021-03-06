%**********************************************************************

function [g,h] = IL4_con(x);

ang1 = x(1);
ang2 = x(2);

IL4_mod; % asssizlammod_4;

g(1) = ils(1,1)/ILSS - 1;
g(2) = ils(1,2)/ILSS - 1;
g(3) = ils(1,3)/ILSS - 1;
g(4) = ils(2,1)/ILSS - 1;
g(5) = ils(2,2)/ILSS - 1;
g(6) = ils(2,3)/ILSS - 1;
g(7) = ils(3,1)/ILSS - 1;
g(8) = ils(3,2)/ILSS - 1;
g(9) = ils(3,3)/ILSS - 1;

g(10) = ...
( (Gsmc(1,1)*Gsmc(1,1))/(Tl*Tl) ) - ...
( (Gsmc(1,1)*Gsmc(1,3))/(Tl*Tl) ) + ...
( (Gsmc(1,3)*Gsmc(1,3))/(Tt*Tt) ) + ...
( (Gsmc(1,5)*Gsmc(1,5))/(SS*SS) ) - ...
1;
g(11) = ...
( (Gsmc(2,1)*Gsmc(2,1))/(Tl*Tl) ) - ...
( (Gsmc(2,1)*Gsmc(2,3))/(Tl*Tl) ) + ...
( (Gsmc(2,3)*Gsmc(2,3))/(Tt*Tt) ) + ...
( (Gsmc(2,5)*Gsmc(2,5))/(SS*SS) ) - ...
1;
g(12) = ...
( (Gsmc(3,1)*Gsmc(3,1))/(Tl*Tl) ) - ...
( (Gsmc(3,1)*Gsmc(3,3))/(Tl*Tl) ) + ...
( (Gsmc(3,3)*Gsmc(3,3))/(Tt*Tt) ) + ...
( (Gsmc(3,5)*Gsmc(3,5))/(SS*SS) ) - ...
1;
g(13) = ...
( (Gsmc(4,1)*Gsmc(4,1))/(Tl*Tl) ) - ...
( (Gsmc(4,1)*Gsmc(4,3))/(Tl*Tl) ) + ...
( (Gsmc(4,3)*Gsmc(4,3))/(Tt*Tt) ) + ...
( (Gsmc(4,5)*Gsmc(4,5))/(SS*SS) ) - ...
1;

h = [];

%**********************************************************************
