%**********************************************************************

if exist('prtf'), fid = fopen(prtf,'w'); else, fid = 1; end;

fprintf(fid,'\\begin{verbatim}\n');

fprintf(fid,'============================================================\n');
  fprintf(fid,'Laminate build-up (lam) \n');
  fprintf(fid,'  z-      z+     ang     El      Et       nutl   Gl \n');
  for i=1:size(lam,1)
    fprintf(fid,'%7.3f %7.3f %7.3f %7.3f %7.3f %7.3f %7.3f \n',lam(i,1:7));
  end;
fprintf(fid,'------------------------------------------------------------\n');
  if isempty(ld)==0
   fprintf(fid,'Mechanical load {ld) \n'); 
   fprintf(fid,' [Nxx Nyy Nxy   Mxx Myy Mxy] = \n');
   fprintf(fid,' [ %6.2f %6.2f %6.2f   %6.2f %6.2f %6.2f ]\n',ld);
  end;
%fprintf(fid,'------------------------------------------------------------\n');
%  if isempty(dT)==0
%   fprintf(fid,'Temperature load (dT) \n');
%   for i = 1:size(dT,1)
%     fprintf(fid,' [ %6.2f ] \n',dT);
%   end;
%  end;
fprintf(fid,'------------------------------------------------------------\n');
  fprintf(fid,'Stiffness matrix \n'); 
  for i=1:6
  for j=1:6
    fprintf(fid,'%10.2e ',S(i,j));
    if j==3, fprintf(fid,'  '); end;
  end;
    if i==3, fprintf(fid,'\n'); end;
    fprintf(fid,'\n');
  end;
fprintf(fid,'------------------------------------------------------------\n');
  fprintf(fid,'Compliance matrix \n'); 
  for i=1:6
  for j=1:6
    fprintf(fid,'%10.2e ',C(i,j));
    if j==3, fprintf(fid,'  '); end;
  end;
    if i==3, fprintf(fid,'\n'); end;
    fprintf(fid,'\n');
  end;
fprintf(fid,'------------------------------------------------------------\n');
  fprintf(fid,'Strains in the mid-plane (e0) \n');
  fprintf(fid,' [ exx  eyy  exy  ] = ');
  fprintf(fid,'[ %7.3e %7.3e  %7.3e ] \n',e0);
  fprintf(fid,'Curvatures of the mid-plane (kr) \n');
  fprintf(fid,' [ kxx  kyy  kxy  ] = ');
  fprintf(fid,'[ %7.3e %7.3e  %7.3e ] \n',kr);
fprintf(fid,'------------------------------------------------------------\n');
  fprintf(fid,'Strains in each ply \n');
  fprintf(fid,' [ exx  eyy  exy    e11  e22  e12] = \n');
  for i=1:npl
  fprintf(fid,'%2d top  ',i);
  for j=1:6
    fprintf(fid,'%9.2e ',rek(2*i-1,j));
    if j==3, fprintf(fid,'  '); end
  end
  fprintf(fid,'\n');
  fprintf(fid,'%2d avg  ',i);
  for j=1:6
    fprintf(fid,'%9.2e ',Geav(i,j));
    if j==3, fprintf(fid,'  '); end
  end;
  fprintf(fid,'\n');
  fprintf(fid,'%2d bot  ',i);
  for j=1:6
    fprintf(fid,'%9.2e ',rek(2*i,j));
    if j==3, fprintf(fid,'  '); end
  end;
  fprintf(fid,'\n');
%    if i==npl, fprintf(fid,'\n'); end;
  end;
fprintf(fid,'------------------------------------------------------------\n');
  fprintf(fid,'Stresses in each ply \n');
  fprintf(fid,' [ sxx  syy  sxy    s11  s22  s12] = \n');
  for i=1:npl
  fprintf(fid,'%2d top  ',i);
  for j=1:6
    fprintf(fid,'%9.2e ',str(2*i-1,j));
    if j==3, fprintf(fid,'  '); end
  end
  fprintf(fid,'\n');
  fprintf(fid,'%2d avg  ',i);
  for j=1:6
    fprintf(fid,'%9.2e ',Gsav(i,j));
    if j==3, fprintf(fid,'  '); end
  end;
  fprintf(fid,'\n');
  fprintf(fid,'%2d bot  ',i);
  for j=1:6
    fprintf(fid,'%9.2e ',str(2*i,j));
    if j==3, fprintf(fid,'  '); end
  end;
  fprintf(fid,'\n');
%    if i==npl, fprintf(fid,'\n'); end;
  end;
fprintf(fid,'------------------------------------------------------------\n');
  fprintf(fid,'Interlaminar shear stress \n');
  for i=1:(npl-1)
  fprintf(fid,' intf %2d  ',i);
  for j=1:3
    fprintf(fid,'%9.2e  ',ils(i,j));
  end;
  fprintf(fid,'\n');
  end;
fprintf(fid,'============================================================\n');

fprintf(fid,'\\end{verbatim}\n');


%**********************************************************************
