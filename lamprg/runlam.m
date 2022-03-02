%*************************************************************************
% runlam.m
%======================================================================

npl = size(lam,1); 
ncl = size(lam,2);

if ncl==7,         lam(:,8:11) = 0; end;
if ~exist('ld'),   ld = zeros(6,1)'; end;
if ~exist('strb'), strb = zeros(npl,5); end;
if ~exist('rekb'), rekb = zeros(npl,5); end;
if ~exist('cr'),   cr = ones(npl,1)'; end;
if ~exist('fm'),   fm = zeros(npl,1)'; end;
if ~exist('zm'),   zm = 0; end;
if ~exist('ls'),   ls = 'sl'; end;
if zm==1,          npl = 2*npl; end;
if ~exist('dT'),   dT = zeros(npl,1)'; end;
if ~exist('c'),    c = zeros(npl,1)'; end;

if zm==1,  mirror; end;
[et] = lamtc(dT,c,lam);
[S,C,ld0,zn] = lamscm(lam,et,fm);
[e0,kr,rek,str] = lamstr(S,C,et,ld0,ld,lam,fm);
[eng] = lameng(lam,e0,kr);
[fm] = lamfail(cr,fm,et,str,rek,strb,rekb);
%[e0,kr,rek,str,fail,zn] = lamber(lam,strb,rekb,dT,c,ld,cr); fail, fm
% Ply stresses and strains are calculated.
% Type 'help plystr' for definitions.
[Gsmc Gsgc Gsav Gemc Gegc Geav ils] = plystr(npl,str,rek);

%*************************************************************************
