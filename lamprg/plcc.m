%*****************************************************************
% function plcc(Sx1,Sx2,SM,level,licol,listy)
% Sx1      = design variable x1
% Sx2      = design variable x2
% SM       = function
% level    = array with levels
% licol    = line color
% listy    = line style
%*****************************************************************

function plcc(Sx1,Sx2,SM,level,licol,listy)

if ~exist('level'), level=[]; end;
if ~exist('licol'), licol='k'; end;
if ~exist('listy'), listy='-'; end;

n1 = size(SM,1);     % number of rows
n2 = size(SM,2);     % number of columns

zerolevel=0; autolevel=0; onelevel=0; fixlevel=0; CM = SM;

if size(level,1)==0, autolevel = 1; end;
if max(size(level))==2 & level(1)==level(2), onelevel = 1; end;
if max(size(level))==2, if level(1)==0 & level(2)==0, zerolevel = 1; end;end;
if max(size(level))==2 & level(1)~=level(2), fixlevel = 1; end;
if max(size(level))>2, fixlevel = 1; end;

if zerolevel==1, CM = SM - ones(n1,n2); end;

if min(size(Sx1)) == 1, CM = CM'; end;

if autolevel==1
  type='autolevel';
  contour(Sx1,Sx2,CM,30,[listy,licol]);
end;

if zerolevel==1
  type='zerolevel';
  contour(Sx1,Sx2,CM,level,[listy,licol]); 
  min1=min(min(Sx1));max1=max(max(Sx1));
  min2=min(min(Sx2));max2=max(max(Sx2));
  maxx=max(max(CM)); minn=min(min(CM));
  nnn=ceil(((maxx-minn)/(max1-min1)+(maxx-minn)/(max2-min2))/2);
  dcl = (maxx/nnn-minn)/(50); clb=dcl; cle=10*dcl;
  hold on;
%  dc = 0.1:0.05:1.0;
  dc = clb:dcl:cle;
  contour(Sx1,Sx2,CM,dc,[':',licol]);
  hold off;
end;

if onelevel==1 & zerolevel==0,
  type='onelevel';
  contour(Sx1,Sx2,CM,level,[listy,licol]);
end;

if fixlevel==1,
  type='fixlevel';
  contour(Sx1,Sx2,CM,level);
end;

fprintf('plot contour: %s, %s, %2.0d x %2.0d \n',type,licol,n1,n2);

clear level licol listy;

%**********************************************************************
