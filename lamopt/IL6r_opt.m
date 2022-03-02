%**********************************************************************

clear all; close all;

x0 = [ 0 0 0 0 ];
lb = [ 0 0 0 0 ];
ub = [ 90 90 90 90 ];

%======================================================================
saveX0 = x0;

IL6r_val; % asslamval_6r;
ang1 = x0(1);
ang6 = x0(2);
ang2 = x0(3);
ang5 = x0(4);

IL6r_mod; % asslammod_6r;

curvature0 = kr(3);

[g0,h0] = IL6r_con(x0);

plotlam; plotstr; prntlam;

%======================================================================
x0 = saveX0;

options = optimset('fmincon');
options = optimset(options,'Display','Iter');
options = optimset(options,'TolX',1e-8,'TolCon',1e-8,'TolFun',1e-8);

global HISTORY
HISTORY.x = [];
HISTORY.fval = [];
options = optimset(options,'outputfcn',@outfun);


[x,fval,exitflag,output,lambda,grad]=...
    fmincon('IL6r_obj',x0,[],[],[],[],lb,ub,'IL6r_con',options);

HISTORY.x
HISTORY.fval

%======================================================================
saveX = x;

IL6r_val; % asslamval_6r;
ang1 = x(1);
ang6 = x(2);
ang2 = x(3);
ang5 = x(4);

IL6r_mod; % asslammod_6r;

curvature = kr(3);

[g,h] = IL6r_con(x);

plotlam; 
%print('-depsc2','/home/piet/wdoc/tex/syl/dnt/fig/asslamopt_6rsoldef');
plotstr; 
%print('-depsc2','/home/piet/wdoc/tex/syl/dnt/fig/asslamopt_6rsolstr');


prntlam;

x = saveX;

%======================================================================

 nit = size(HISTORY.fval,1); nt = 1:1:nit;
 hx1 = HISTORY.x(:,1);
 hx2 = HISTORY.x(:,2);
 hx3 = HISTORY.x(:,3);
 hx4 = HISTORY.x(:,4);
 hf  = HISTORY.fval;
 hkxy = sqrt(hf./1e8);
 figure;
 plot(nt,hkxy,nt,hkxy,'rx'); grid on;
 xlabel('iterations'); ylabel('curvature')

%**********************************************************************
