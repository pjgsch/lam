%**********************************************************************
% Effective material parameters for composites are calculated with
% the next m-files.
%
% [vf,ep] = effem(vmin,vmax,em,ep,nm,np,fn);
% [vf,el] = effeml(vmin,vmax,em,ef,nm,nf,fn)
% [vf,et] = effemt(vmin,vmax,em,ef,nm,fn)
% [vf,gl] = effglt(vmin,vmax,em,ef,nm,nf,fn)
%
% vmin  =  minimum volume fraction of particles/fibres
% vmax  =  maximum volume fraction of particles/fibres
% em    =  Young's modulus of matrix
% ep    =  Young's modulus of particles
% ef    =  Young's modulus of fibres
% nm    =  Poisson's ratio of matrix
% np    =  Poisson's ratio of particles
% nf    =  Poisson's ratio of fibres
% fn    =  formula for the calculation of the effective values;
% 	   see the corrsponding m-file for more information.
% vf    =  array with volume fractions 
% ep    =  array with effective Young's moduli
% el    =  array with effective longitudinal moduli
% et    =  array with effective transversal moduli
% glt   =  array with effective shear moduli
%
%**********************************************************************

%path('/home/piet/work/mlf/comp',path);

%======================================================================
%{
lsp $FILSDIR/work/mlf/comp/ > comp.txt
%}
%======================================================================
% Particle composites.

close all;clear all;

vmin=0.3;vmax=0.9;em=2;ep=200;nm=0.45;np=0.2;sax=1;

[vf3,e3]=effem(vmin,vmax,em,ep,nm,np,3);
[vf1,e1]=effem(vmin,vmax,em,ep,nm,np,1);
[vf2,e2]=effem(vmin,vmax,em,ep,nm,np,2);
[vf4,e4]=effem(vmin,vmax,em,ep,nm,np,4);
[vf5,e5]=effem(vmin,vmax,em,ep,nm,np,5);
maxem = max(max([e1 e2 e3 e4 e5]));

figure;plot(vf3,e3);grid on;
xlabel('volume fraction');ylabel('E [GPa]');title('Effective modulus for particle composite');
legend('Eshelby','Location','NorthWest');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxem]); end;

figure;plot(vf2,e2,vf1,e1);grid on;
xlabel('volume fraction');ylabel('E [GPa]');title('Effective modulus for particle composite');
legend('Paul-lwr','Paul-upr','Location','NorthWest');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxem]); end;

figure;plot(vf4,e4,vf5,e5);grid on;
xlabel('volume fraction');ylabel('E [GPa]');title('Effective modulus for particle composite');
legend('Hashin-Shtrikman-lwr','Hashin-Shtrikman-upr','Location','NorthEast');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxem]); end;

%======================================================================
% Unidirectional fiber composites

%----------------------------------------------------------------------
% Longitudinal modulus

close all;clear all;

vmin=0.3;vmax=0.9;em=2;ef=200;nm=0.45;nf=0.2;

[vf1,el1]=effeml(vmin,vmax,em,ef,nm,nf,1);
[vf2,el2]=effeml(vmin,vmax,em,ef,nm,nf,2);

figure;plot(vf1,el1,vf2,el2);grid on;
xlabel('volume fraction');ylabel('E_l [GPa]');title('Effective longitudinal modulus');
legend('Rule-of-Mixtures','Hashin-Rosen','Location','NorthWest');

%----------------------------------------------------------------------
% Transversal modulus

close all;clear all;

vmin=0.3;vmax=0.9;em=2;ef=200;nm=0.45;sax=1;

[vf1,et1]=effemt(vmin,vmax,em,ef,nm,1);
[vf2,et2]=effemt(vmin,vmax,em,ef,nm,2);
[vf3,et3]=effemt(vmin,vmax,em,ef,nm,3);
[vf4,et4]=effemt(vmin,vmax,em,ef,nm,4);
[vf5,et5]=effemt(vmin,vmax,em,ef,nm,5);
[vf6,et6]=effemt(vmin,vmax,em,ef,nm,6);
[vf7,et7]=effemt(vmin,vmax,em,ef,nm,7);
maxet = max(max([et1 et2 et3 et4 et5 et6 et7]));

figure;plot(vf1,et1);grid on;
xlabel('volume fraction');ylabel('E_t [GPa]');title('Effective transversal modulus');
legend('Rule-of-Mixtures','Location','NorthWest');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxet]); end;

figure;plot(vf2,et2,vf3,et3,vf4,et4);grid on;
xlabel('volume fraction');ylabel('E_t [GPa]');title('Effective transversal modulus');
legend('Puck-1','Puck-2','Puck-3','Location','NorthWest');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxet]); end;

figure;plot(vf5,et5,vf6,et6,vf7,et7);grid on;
xlabel('volume fraction');ylabel('E_t [GPa]');title('Effective transversal modulus');
legend('Foerster','Tsai','Chamis','Location','NorthWest');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxet]); end;

%----------------------------------------------------------------------
% Shear modulus

close all;clear all;

vmin=0.3;vmax=0.9;em=2;ef=200;nm=0.45;nf=0.2;sax=1;

[vf1,glt1]=effglt(vmin,vmax,em,ef,nm,nf,1);
[vf2,glt2]=effglt(vmin,vmax,em,ef,nm,nf,2);
[vf3,glt3]=effglt(vmin,vmax,em,ef,nm,nf,3);
[vf4,glt4]=effglt(vmin,vmax,em,ef,nm,nf,4);
[vf5,glt5]=effglt(vmin,vmax,em,ef,nm,nf,5);
[vf6,glt6]=effglt(vmin,vmax,em,ef,nm,nf,6);
[vf7,glt7]=effglt(vmin,vmax,em,ef,nm,nf,7);
[vf8,glt8]=effglt(vmin,vmax,em,ef,nm,nf,8);
maxglt = max(max([glt1 glt2 glt3 glt4 glt5 glt6 glt7 glt8]));

figure;plot(vf1,glt1);grid on; 
xlabel('volume fraction');ylabel('G_{lt} [GPa]');title('Effective shear modulus');
legend('Rule-of-Mixtures','Location','NorthWest');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxglt]); end;

figure;plot(vf2,glt2,vf3,glt3);grid on; 
xlabel('volume fraction');ylabel('G_{lt} [GPa]');title('Effective shear modulus');
legend('Puck-1','Puck-2','Location','NorthWest');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxglt]); end;

figure;plot(vf4,glt4);grid on; 
xlabel('volume fraction');ylabel('G_{lt} [GPa]');title('Effective shear modulus');
legend('Foerster','Location','NorthWest');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxglt]); end;

figure;plot(vf5,glt5,vf6,glt6,vf7,glt7,vf8,glt8);grid on; 
xlabel('volume fraction');ylabel('G_{lt} [GPa]');title('Effective shear modulus');
legend('Tsai','Hashin-Rosen','Chamis','Christensen','Location','NorthWest');
if sax==1, ax=axis; axis([ax(1) ax(2) ax(3) maxglt]); end;

%**********************************************************************
