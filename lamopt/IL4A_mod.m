%**********************************************************************

lam  = [ 
b1 t1  ang1  El1  Et1  Gnlt1  Glt1     0    0    0    0
b2 t2  ang2  El2  Et2  Gnlt2  Glt2     0    0    0    0  
b3 t3  ang3  El3  Et3  Gnlt3  Glt3     0    0    0    0
b4 t4  ang4  El4  Et4  Gnlt4  Glt4     0    0    0    0
%b5 t5  ang5  El5  Et5  Gnlt5  Glt5     0    0    0    0
%b6 t6  ang6  El6  Et6  Gnlt6  Glt6     0    0    0    0
];

ld   = [ Nxx Nyy Nxy Mxx Myy Mxy ];

runlam; 

Gexx = e0(1); Geyy = e0(2); Gexy = e0(3);
Gkxx = kr(1); Gkyy = kr(2); Gkxy = kr(3);

%[ Gsmc Gsgc Gsav Gemc Gegc Geav ils ] = plystr(npl,str,rek);

%**********************************************************************
