%**********************************************************************
% maxrek.m
%
% [fm] = maxrek(rekb,rek,et)
%
% Maximum strain failure criterion for laminate.
% 
% fm(ply.nr) = 0|1|2 : 0 -> no failure
%                      1 -> shear failure
%                      2 -> tensile or compressive failure 
%======================================================================

function [mode] = maxrek(rekb,rek,et);

mode = 0;

for j=1:2
  ek = rek(j,1:3) - et;

  if     ( ek(1)<rekb(2) | ek(1)>rekb(1) ), mode=2; break
  elseif ( ek(2)<rekb(4) | ek(2)>rekb(3) ), mode=1; break
  elseif   abs(ek(3))>rekb(5),              mode=1;
  end;
end;

%**********************************************************************
