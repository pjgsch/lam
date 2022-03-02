%*************************************************************************
% effem
%
% Berekenen van effectieve modulus voor composietmateriaal.
% [vf,e]=effem(vmin,vmax,em,ep,nm,np,fn);
%
% fn=1 : Paul (1960) boven
% fn=2 : Paul (1960) onder
% fn=3 : Eshelby (1957)
% fn=4 : Hashin,Shtrikman (1963) onder
% fn=5 : Hashin,Shtrikman (1963) boven
%
function [vf,e]=effem(vmin,vmax,em,ep,nm,np,fn);
step = 0.001;
i=0;
gp=ep/(2*(1+np)); gm=em/(2*(1+nm));
kp=ep/(3*(1-2*np)); km=em/(3*(1-2*nm));
for v=vmin:step:vmax
  i=i+1;
  vf(i)=v;
  if fn==1 e(i)=v*ep+(1-v)*em; end;
  if fn==2 e(i)=1/(v/ep+(1-v)/em); end;
  if fn==3
    g=gm+(gp-gm)*5*(3*km+4*gm)*v/(9*km+8*gm+6*(km+2*gm)*gp/gm);
    k=km+(kp-km)*(3*km+4*gm)*v/(3*kp+4*gm);
    e(i)=9*k*g/(3*k+g); 
  end;
  if fn==4
    g=gm+v/(1/(gp-gm)+6*(1-v)*(km+2*gm)/(5*gm*(3*km+4*gm)));
    k=km+v/(1/(kp-km)+3*(1-v)/(3*km+4*gm));
    e(i)=9*k*g/(3*k+g);
  end;
  if fn==5
    g=gp+v/(1/(gm-gp)+6*(1-v)*(kp+2*gp)/(5*gp*(3*kp+4*gp)));
    k=kp+v/(1/(km-kp)+3*(1-v)/(3*kp+4*gp));
    e(i)=9*k*g/(3*k+g);
  end;
end;
vf=vf'; e=e';
%*************************************************************************
