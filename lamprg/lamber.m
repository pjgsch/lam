%**********************************************************************
%
%   [e0,kr,rek,str,fail,zn] = lamber(lam,strb,rekb,dT,c,ld,cr)
%
%  Strains and stresses of/in the plies are calculated for the 
%  prescribed boundary load 'ld'.
%  Failure of plies is taken into account.
%  One of two failure criteria can be used to decide when a ply will
%  fail :
%
%    1. Tsai-Wu stress criterion: cr(k)=1
%       'strb' = [1trek 1druk 2trek 2druk 12] has to be provided [Pa],
%    2. maximum strain criterion: cr(k)=2
%       'rekb' = [1trek 1druk 2trek 2druk 12] has to be provided.
%
%  A ply can fail in two modes :
%
%    1. fiber-mode  : 
%       the ply can no longer carry any load,
%    2. matrix-mode : 
%       the ply can carry a load in 1-direction (fiber) only.
%
%    'fail(nk)' indicates which plies have failed in which mode. 
%    See also LAMTC, LAMSCME, LAMSTRE.
%

function [e0,kr,rek,str,fail,zn] = lamber(lam,strb,rekb,dT,c,ld,cr);

nk = size(lam,1);                                     % number of plies

mode0 = ones(nk,1);
mode1 = zeros(nk,1);

[et] = lamtc(dT,c,lam);

while min(mode0==mode1)~=1,
   
    mode0 = mode1; 

    [S,C,ld0,zn] = lamscm(lam,et,mode1);

    if min(diag(C))<0|min(diag(S))<0,
      mode1 = 2*ones(nk,1), pause; break; end;
    if rcond(S)<1e-15,
      mode1 = 2*ones(nk,1), pause; break; end;

    [e0,kr,rek,str] = lamstr(S,C,et,ld0,ld,lam,mode1);

    for k=1:nk

     if mode1(k)~=2,

       if cr(k)==1,
         [mode] = tsaiwu(strb(k,1:5),str(2*k-1:2*k,1:3));       
       end;
       if cr(k)==2,
         [mode] = maxrek(rekb(k,1:5),rek(2*k-1:2*k,1:3),et(k)); 
       end;

       if mode>0,
         mode1(k) = mode;
       end;

     end;
    end; 

    mode1'                               % mode1 is shown on the screen

    if min(mode1)==2,min(mode1), break; end;

end;

if min(mode1)==2,
  fail='breuk';
  e0  = zeros(3,1);    
  kr  = zeros(3,1);   
  zn  = zeros(3,1);
  rek = zeros(2*nk,6); 
  str = zeros(2*nk,6);
else,
  for k=1:nk
    if mode1(k)==0, fail(k,1:2)  = [k+48,' '];                     end;
    if mode1(k)==1, fail(k,1:12) = [k+48,'matrix-mode'];           end;
    if mode1(k)==2, fail(k,1:22) = [k+48,'fiber-mode=total-mode']; end;
  end;
end;

%**********************************************************************
