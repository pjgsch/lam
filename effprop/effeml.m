%*************************************************************************
% effeml
%
% Berekenen van effectieve longitudinale modulus voor composietmateriaal.
% [vf,el]=effeml(vmin,vmax,em,ef,nm,nf,fn);
%
% fn=1 : Rule of mixtures
% fn=2 : Hashin,Rosen (1964)
%

function [vf,el]=effeml(vmin,vmax,em,ef,nm,nf,fn);

step = 0.001;
n = round((vmax-vmin)/step) + 1;
gf = ef/(2*(1+nf)); kf = ef/(3*(1-2*nf)); 
gm = em/(2*(1+nm)); km = em/(3*(1-2*nm));

for i=1:n
  v = vmin + (i-1)*step;
  vf(i) = v;
  if fn==1 el(i) = v*ef + (1-v)*em; end;
  if fn==2 
    el(i) = v*ef + (1-v)*em + 4*(nf-nm)*v*(1-v)/(v/km+(1-v)/kf+1/gm); 
  end;
end;

vf=vf'; el=el';

%*************************************************************************
