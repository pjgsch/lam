%**********************************************************************
% plotstr
% 
% plots stresses and strains
%======================================================================

figure;

n=size(lam); nk=n(1);za=0;
for k=1:nk
  for j=2:-1:1
    za(2*k-(j-1))=lam(k,j);
  end;
end;

subplot(221);
y1=str(1:2*nk,1:1); y2=str(1:2*nk,2:2); y3=str(1:2*nk,3:3);
plot(y1,za,'-',y2,za,'-.',y3,za,'--');
ylabel('z  [mm]'); xlabel('\sigma  [Pa]');
legend('xx','yy','xy');
%pause

subplot(222);
y1=str(1:2*nk,4:4); y2=str(1:2*nk,5:5); y3=str(1:2*nk,6:6);
plot(y1,za,'-',y2,za,'-.',y3,za,'--')
ylabel('z  [mm]'); xlabel('\sigma  [Pa]');
legend('11','22','12');
%pause

subplot(223);
y1=rek(1:2*nk,1:1); y2=rek(1:2*nk,2:2); y3=rek(1:2*nk,3:3);
plot(y1,za,'-',y2,za,'-.',y3,za,'--')
ylabel('z  [mm]'); xlabel('\epsilon  [-]');
legend('xx','yy','xy');
%pause

subplot(224);
y1=rek(1:2*nk,4:4); y2=rek(1:2*nk,5:5); y3=rek(1:2*nk,6:6);
plot(y1,za,'-',y2,za,'-.',y3,za,'--')
ylabel('z  [mm]'); xlabel('\epsilon  [-]');
legend('11','22','12');


%**********************************************************************
