%**********************************************************************
close all;clear all;
opengl neverselect;

Ef = 100000;
Em = 1000;

lf0 = 1;   lfe = 2;
df0 = 0.1; dfe = 0.3;
a0  = 0.2; ae  = 0.5;
b0  = 0.5; be  = 1;

lf = lf0; df = df0; a = a0; b = b0;
Vt0 = (lf0+a0)*(df0+b0);
Vf0 = df0*lf0;
Vm0 = lf0*b0 + a0*b0 + a0*df0;
V0  = Vf0/Vt0;

ni = 20; nj = 20;

Sdf = df0:(dfe-df0)/ni:dfe;
%Slf = lf0:(lfe-lf0)/nj:lfe;
Slf = Vf0./Sdf;

for i=1:(ni+1)

df = Sdf(i); 

b = (df0+b0)-df;

for j=1:(nj+1)

lf = Slf(j);

a = (lf0+a0)-lf;

Vt = (lf+a)*(df+b);
Vf = df*lf;
Vm = lf*b + a*b + a*df;
V  = Vf/Vt;

% GeGs

k1 = Ef*df/lf; k2 = Em*b/lf; k4 = Em*b/a; k5 = Em*df/a; k3 = k4+k5;
k  = k3*(k1+k2)/(k1+k2+k3);
E1 = k*(lf+a)/(df+b);

% GsGe

k  = ( k1*k5*(k2+k4)+k2*k4*(k1+k5) )/( (k1+k5)*(k2+k4) );
E2 = k*(lf+a)/(df+b);

SE1(i,j) = E1;
SE2(i,j) = E2;
SVt(i,j) = Vt;
SVf(i,j) = Vf;
SVm(i,j) = Vm;
SV(i,j)  = V;

end;
end;

figure;surf(Sdf,Slf,SE1);grid on;
figure;surf(Sdf,Slf,SE2);grid on;
figure;surf(Sdf,Slf,SVt);grid on;
figure;surf(Sdf,Slf,SVf);grid on;
figure;surf(Sdf,Slf,SVm);grid on;
figure;surf(Sdf,Slf,SV);grid on;

%**********************************************************************
