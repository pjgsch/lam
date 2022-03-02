%**********************************************************************

clear all; % close all;

x0 = [ -20 85 ]; 
lb = [ -90 0 ];
ub = [  0 90 ];

%======================================================================
saveX0 = x0;

IL4A_val; 
ang1 = x0(1);
ang2 = x0(2);
ang3 = ang2;
ang4 = ang1;

IL4A_mod;

curvature0 = kr(3);

[g0,h0] = IL4A_con(x0);

plotlam; plotstr; prntlam;

%======================================================================
x0 = saveX0;

options = optimset('fmincon');
options = optimset(options,'Display','Iter');
%options = optimset(options,'TolX',1e-8,'TolCon',1e-8,'TolFun',1e-8);

[x,fval,exitflag,output,lambda,grad]=...
    fmincon('IL4A_obj',x0,[],[],[],[],lb,ub,'IL4A_con',options);

%======================================================================
saveX = x;

IL4A_val;

ang1 = x(1);
ang2 = x(2);
ang3 = ang2;
ang4 = ang1;

IL4A_mod;

curvature = kr(3);

[g,h] = IL4A_con(x);

plotlam; plotstr; prntlam;

x = saveX;

%**********************************************************************
