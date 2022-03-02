%*************************************************************************
% effglt
%
% Berekenen van effectieve glijdingsmodulus voor composietnateriaal.
% [vf,gl]=effglt(vmin,vmax,em,ef,nm,nf,fn);
%
% fn=1 : Rule of mixtures
% fn=2 : Puck
% fn=3 : Puck
% fn=4 : Foerster
% fn=5 : Tsai
% fn=6 : Hashin,Rosen (1964)
% fn=7 : Chamis (1984)
% fn=8 : Christensen (1979)
%
function [vf,gl]=effglt(vmin,vmax,em,ef,nm,nf,fn);
step = 0.001;
n = round((vmax-vmin)/step) + 1;
gf=ef/(2*(1+nf)); gm=em/(2*(1+nm));
for i=1:n
  v = vmin + (i-1)*step;
  vf(i)=v;
  if fn==1 glti=v/gf+(1-v)/gm; gl(i)=1/glti; end;
  if fn==2 glti=v/gf+(1-v)^1.25/gm; gl(i)=1/glti; end;
  if fn==3 glti=(v/gf+(1-v)^1.25/gm)/(1+0.6*v^0.5); gl(i)=1/glti; end;
  if fn==4 glti=(v/gf+(1-v)^1.45/gm)/(1+0.4*v^0.5); gl(i)=1/glti; end;
  if fn==5 glti=(v/gf+0.5*(1-v)/gm)/(v+0.5*(1-v)); gl(i)=1/glti; end;
  if fn==6 gl(i)=gm+v/(1/(gf-gm)+(1-v)/(2*gm)); end;
  if fn==7 gl(i)=gm/(1-(1-gm/gf)*sqrt(v)); end;
  if fn==8 gl(i)=gm+2*v*gm*(gf-gm)/(2*gm+(1-v)*(gf-gm)); end;
end;
vf=vf'; gl=gl';
%*************************************************************************
