%**********************************************************************
%
% [fm] = tsaiwu(strb,str)
%
% Tsai-Wu failure criterium for laminate.
%
% fm(ply.nr) = 0|1|2 : 0 -> no failure
%                      1 -> shear failure
%                      2 -> tensile or compressive failure 
%======================================================================

function [mode] = tsaiwu(strb,str);
        
mode = 0;

F = zeros(1,3); FF = zeros(3,3);

F(1) = 1/strb(1)+1/strb(2);
F(2) = 1/strb(3)+1/strb(4);

FF(1,1) = -1/strb(1)/strb(2);
FF(2,2) = -1/strb(3)/strb(4);
FF(3,3) =  1/strb(5)^2;
FF(1,2) = -0.5*(FF(1,1)*FF(2,2))^0.5;
FF(2,1) = FF(1,2);

for j=1:2
  sk = str(j,1:3)';

  tsw = F*sk + sk'*FF*sk;

  if tsw>=1,
    if     sk(1)>=strb(1), mode=2; break
    elseif sk(1)<=strb(2), mode=2; break               
    else,  mode=1;
    end;
  end;
end;

%**********************************************************************
