%**********************************************************************
% calculation of transformation matrix for orthotropic material
%======================================================================

function [Tk] = trans(fie);

cc = cos(fie)*cos(fie);
ss = sin(fie)*sin(fie);
sc = sin(fie)*cos(fie);

Tk = [  cc      ss     -sc
        ss      cc      sc
        2*sc   -2*sc    cc-ss   ];

%**********************************************************************
