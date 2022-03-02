%**********************************************************************

exx = e0(1); eyy = e0(2); exy = e0(3);
kxx = kr(1); kyy = kr(2); kxy = kr(3);

k=0;

for x=-1:0.1:1

for y=-1:0.1:1

k=k+1;

u = exx*x + exy*y;
v = exy*x + eyy*y;
w = (kxx/2)*(x^2) + (kyy/2)*(y^2) + (kxy)*(x*y);

x0(k) = x;
y0(k) = y;
z0(k) = 0;

xx(k) = x+u;
yy(k) = y+v;
zz(k) = w;

end;
end;

%plot3(x0,y0,z0,'.',xx,yy,zz,'.');
%xlabel('x'); ylabel('y'); grid on;
%if abs(min(zz))-abs(max(zz))>0, minz=min(zz); maxz=max(zz); 
%else, minz=-eps; maxz=eps; end;
%axis([min(xx) max(xx) min(yy) max(yy) minz maxz]);

k=0;
for i=1:sqrt(length(xx))
for j=1:sqrt(length(yy))
  k=k+1;
  X(j) = y0(j);
  Y(j) = y0(j);
  Z(j,i) = zz(k);
end;
end;

figure;
surf(X,Y,Z); % surfl(X,Y,Z);
xlabel('x'); ylabel('y'); zlabel('w'); grid on;
if min(zz)-max(zz)>0
axis([-1 1 -1 1 min(zz) max(zz)]);
end;
view(125,22);

%**********************************************************************
