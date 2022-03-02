%**********************************************************************

clear all; 

x0 = [ -85.0 75.0 ];

lb = [ -90.0 0.0 ];
ub = [ 0     90  ];

options = optimset('fmincon');

[x,fval,exitflag,output,lambda,grad]=...
    fmincon('IL2_obj',x0,[],[],[],[],lb,ub,'IL2_con',options);

x',
f = IL2_obj(x); curvature = sqrt(f/1e8),
[g,h] = IL2_con(x); g',
ang1 = x(1); ang2 = x(2); 

IL2_mod; plotlam; pltstr;

%**********************************************************************
