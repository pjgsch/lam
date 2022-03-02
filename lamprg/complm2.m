%*************************************************************************
%
% c = complm2(el,et,nu,gl)   compliance matrix
%
% el : longitudinal modulus
% et : transversal modulus
% nu : Poisson's ratio
% gl : shear modulus
% 

function c = complm2(el,et,nu,gl);

c(1,1) = 1/el;
c(2,2) = 1/et;
c(3,3) = 1/gl;
c(2,1) = -nu/el; c(1,2) = c(2,1);          % nu = ntl
%c(1,2)= -nu/et; c(2,1) = c(1,2);          % nu = nlt
c(3,2) = 0; c(2,3)=0; 
c(1,3) = 0; c(3,1)=0; 

%*************************************************************************
