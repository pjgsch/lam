%*************************************************************************
% effemt
%
% Berekenen van efectieve transversale modulus voor composietmateriaal
% [vf,et]=effemt(vmin,vmax,em,ef,nm,fn);
%
% fn=1 : Rule of mixtures (parallel)
% fn=2 : Puck
% fn=3 : Puck
% fn=4 : Puck
% fn=5 : Foerster
% fn=6 : Tsai
% fn=7 : Chamis (1984)
%
function [vf,et]=effemt(vmin,vmax,em,ef,nm,fn);
step = 0.001;
n = round((vmax-vmin)/step) + 1;
for i=1:n
  v = vmin + (i-1)*step;
  vf(i)=v;
  em0=em/(1-nm^2);
  if fn==1 eti=v/ef+(1-v)/em; et(i)=1/eti; end;
  if fn==2 eti=v/ef+(1-v)/em0; et(i)=1/eti; end;
  if fn==3 eti=v/ef+(1-v)^1.25/em0; et(i)=1/eti; end;
  if fn==4 eti=(v/ef+(1-v)^1.25/em0)/(1+0.85*v^2); et(i)=1/eti; end;
  if fn==5 eti=v/ef+(1-v)^1.45/em0; et(i)=1/eti; end;
  if fn==6 eti=(v/ef+0.5*(1-v)/em)/(v+0.5*(1-v)); et(i)=1/eti; end;
  if fn==7 et(i)=em/(1-(1-em/ef)*sqrt(v)); end;
end;
vf=vf'; et=et';
%*************************************************************************
