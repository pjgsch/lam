%**********************************************************************
%======================================================================
% template input file with comment                         edit ILlam.m
close all;clear all; ILlam; runlam; plotlam;plotstr;prntlam;                  
%======================================================================
% isotropic plate; 2-ply (identical)                      edit IL2iso.m
close all;clear all; IL2iso; runlam; plotlam;plotstr;prntlam;                
%======================================================================
% anisotropic plate; 2-ply (identical)                    edit IL2ani.m
close all;clear all; IL2ani; runlam; plotlam;plotstr;prntlam;                
%======================================================================
% 2-ply; thermal load; with analytical solution              edit IL2.m
close all;clear all; IL2; runlam; plotlam;plotstr;prntlam;                      
%======================================================================
% 2-ply;                                                    edit IL2A.m
close all;clear all; IL2A; runlam; plotlam;plotstr;prntlam;                   
%======================================================================
% 4-ply; random                                             edit IL4r.m
IL4r; runlam; plotlam;plotstr;prntlam;                    
%======================================================================
% 4-ply; symmetric                                          edit IL4s.m
IL4s; runlam; plotlam;plotstr;prntlam;                    
%======================================================================
% 8-ply; anti-symmetric                                     edit IL8a.m
IL8a; runlam; plotlam;plotstr;prntlam;                    
%======================================================================
% 8-ply; symmetric                                          edit IL8s.m
IL8s; runlam; plotlam;plotstr;prntlam;                  
%======================================================================
% 2-ply; Tai-Wu criterion                                 edit IL2dam.m
IL2dam; runlam; plotlam;plotstr;prntlam;            
%======================================================================
% 3-ply; thermal load;                                    edit IL3dam.m
IL3dam; runlam; plotlam;plotstr;prntlam;               
%======================================================================
% 4-ply; Tsai-Wu criterion                                edit IL4dam.m
IL4dam; runlam; plotlam;plotstr;prntlam;               
%======================================================================
% 2-ply;                                                edit IL2B_mod.m
close all;clear all; ang1=30;ang2=0; IL2B_mod; plotlam;plotstr;
%======================================================================
% 2-ply;                                                edit IL2C_mod.m
close all;clear all; th1=1;th2=1; IL2C_mod; plotlam;plotstr;                 
%======================================================================
% 4-ply;                                                 edit IL4_mod.m
close all;clear all; 
%ang1 = 0; ang2 = 0; ang3 = 0; ang4 = 0; rsa=1;
%ang1 = 30; ang2 = -30; ang3 = 0; ang4 = 30; rsa=1;
%ang1 = 90; ang2 = 90; ang3 = 0; ang4 = 30; rsa=1;
%ang1 = 30; ang2 = 45; ang3 = 0; ang4 = 30; rsa=1;
ang1 = 30; ang2 = -45; ang3 = 0; ang4 = 30; rsa=1;
IL4_mod; plotlam;plotstr;printlam;                       
%======================================================================

%**********************************************************************

