%**********************************************************************

function f = IL6r_obj(x,scalef);

% Design variables

IL6r_val; % asslamval_6r;

ang1 = x(1);  
ang6 = x(2);  
ang2 = x(3);
ang5 = x(4);

IL6r_mod; % asslammod_6r;

f = Gkxy*Gkxy * 1e8;

%**********************************************************************