%*************************************************************************
%
% effpar
%
% Berekenen van effectieve materiaalparameters van composieten
%
effinv;
%
fprintf(' Volumefractie Minimum (vmin) :  %g\n',vmin);
fprintf(' Volumefractie Maximum (vmax) :  %g\n',vmax);
fprintf(' Incrementation Step (step)   :  %g\n',step);
fprintf(' Matrix Modulus (em)          :  %g\n',em);
fprintf(' Vezel Modulus (ef)           :  %g\n',ef);
fprintf(' Matrix Poisson (nm)          :  %g\n',nm);
fprintf(' Vezel Poisson (nf)           :  %g\n',nf);
disp(' ');
w = input('Invoerparameters wijzigen (1=ja)   :  ');
if w==1
  disp(' Wijzig de invoerparameters');
  disp(' Type CTRL-Z of "return" (letterlijk !)');
  keyboard;
  delete effinv.m;
  fprintf('effinv.m','vmin  =  %g;\n',vmin);
  fprintf('effinv.m','vmax  =  %g;\n',vmax);
  fprintf('effinv.m','step  =  %g;\n',step);
  fprintf('effinv.m','em    =  %g;\n',em);
  fprintf('effinv.m','ef    =  %g;\n',ef);
  fprintf('effinv.m','nm    =  %g;\n',nm);
  fprintf('effinv.m','nf    =  %g;\n',nf);
end;  
disp(' ');
disp(' Effectieve Longitudinale Modulus             1');
disp(' Effectieve Transversale Modulus              2');
disp(' Effectieve Glijdingsmodulus                  3');
disp(' ');
k = input('Keuze          :   ');

if k==1
  a = zeros(2,1); mel = [];
  disp('Typ 1 voor selectie')
  a(1) = input('1  Rule of mixtures                   :  ');
  a(2) = input('2  Hashin, Rosen (1964)               :  ');
  disp(' ');
  for i=1:2
    if a(i)==1
      fprintf('%g ',i);
      [vf,el] = effeml(vmin,vmax,em,ef,nm,nf,step,i);
      mel = [mel el];
    end;
  end;
  n = size(vf); 
  if n(1)==1, vf, mel, else,  
    plot(vf,mel); 
    xlabel('volume fraction'); ylabel('E 1');
    title('Effective Modulus E 1');  
  end;  
elseif k==2
  a = zeros(7,1); met = [];
  disp('Typ 1 voor selectie')
  a(1) = input('1  Rule of mixtures (parallel)        :  ');
  a(2) = input('2  Puck                               :  ');
  a(3) = input('3  Puck                               :  ');
  a(4) = input('4  Puck                               :  ');
  a(5) = input('5  Foerster                           :  ');
  a(6) = input('6  Tsai                               :  ');
  a(7) = input('7  Chamis (1984)                      :  ');
  disp(' ');
  for i=1:7
    if a(i)==1
      fprintf('%g ',i);
      [vf,et]=effemt(vmin,vmax,em,ef,nm,step,i);
      met = [met et];
    end;
  end;
  n = size(vf); 
  if n(1)==1, vf, met, else,  
    plot(vf,met); 
    xlabel('volume fraction'); ylabel('E 2');
    title('Effective Modulus E 2');  
  end;
elseif k==3
  a = zeros(8,1); mgl = [];
  disp('Typ 1 voor selectie')
  a(1) = input('1  Rule of mixtures                   :  ');
  a(2) = input('2  Puck                               :  ');
  a(3) = input('3  Puck                               :  ');
  a(4) = input('4  Foerster                           :  ');
  a(5) = input('5  Tsai                               :  ');
  a(6) = input('6  Hashin,Rosen (1964)                :  ');
  a(7) = input('7  Chamis (1984)                      :  ');
  a(8) = input('8  Christensen (1979)                 :  ');
  disp(' ');
  for i=1:8
    if a(i)==1
      fprintf('%g ',i);
      [vf,gl] = effglt(vmin,vmax,em,ef,nm,nf,step,i);
      mgl = [mgl gl];
    end;
  end;
  n = size(vf); 
  if n(1)==1, vf, mgl, else,  
    plot(vf,mgl); 
    xlabel('volume fraction'); ylabel('G 1');
    title('Effective Modulus G 1');  
  end;
end;
      
%*************************************************************************
