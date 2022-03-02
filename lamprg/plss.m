%**********************************************************************

function plss(Sx1,Sx2,SM,negzer);

if ~exist('negzer'), negzer = 0; end;

n1 = size(SM,1);
n2 = size(SM,2);

CM = SM;
if negzer==1, CM = SM - ones(n1,n2); end;

if min(size(Sx1)) == 1, CM = CM'; end;

surf(Sx1,Sx2,CM);
if negzer==1, fprintf('negative zero plot \n'); end;

%**********************************************************************
