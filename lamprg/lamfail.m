%======================================================================
% lamfail.m
%
% [fm] = lamfail(cr,fm,et,str,rek,strb,rekb)
%
% Calculates the failure mode in a laminate.
% Uses : tsaiwu.m : [fm] = tsaiwu(strb,str)
% Uses : maxrek.m : 
%
% cr(ply.nr) = 1     : Tsai-Wu criterion
% cr(ply.nr) = 2     : Maximum strain criterion
% 
% fm(ply.nr) = 0|1|2 : 0 -> no failure
%                      1 -> shear failure
%                      2 -> tensile or compressive failure
%======================================================================

function [mode] = lamfail(cr,mode,et,str,rek,strb,rekb);

nk = size(mode,1);                                    % number of plies

for k=1:nk
  if mode(k)~=2                                 % not completely failed
    if cr(k)==1, 
      [m] = tsaiwu(strb(k,1:5),str(2*k-1:2*k,1:3)); 
    end;
    if cr(k)==2, 
      [m] = maxrek(rekb(k,1:5),rek(2*k-1:2*k,1:3),et(k)); 
    end;
    if m>0, mode(k) = m; end;                                 % failure
  end;
end;

%**********************************************************************
