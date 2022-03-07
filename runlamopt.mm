%**********************************************************************
%======================================================================
% Parameterized input for optimization
% The model-file '_mod.m' also runs the analysis 'runlam'
% The 'clear all; close all' commands must not be placed in '_mod.m'
%======================================================================

%======================================================================
close all;clear all; 
ang1=30;ang2=0; IL2_mod; plotlam;plotstr;prntlam;      % edit IL2_mod.m 
IL2_run;                                               % edit IL2_run.m
IL2_opt;                                               % edit IL2_opt.m
%======================================================================
close all;clear all;
ang1=30;ang2=0; IL2B_mod; plotlam;plotstr;            % edit IL2B_mod.m
IL2B_run;                                             % edit IL2B_run.m
IL2B_opt;                                             % edit IL2B_opt.m
%======================================================================
close all;clear all; 
th1=1;th2=1; IL2C_mod; plotlam;plotstr;               % edit IL2C_mod.m
IL2C_opt;                                             % edit IL2C_opt.m
%======================================================================
close all;clear all; 
%ang1 = 0; ang2 = 0; ang3 = 0; ang4 = 0;
%ang1 = 30; ang2 = -30; ang3 = 0; ang4 = 30;
%ang1 = 90; ang2 = 90; ang3 = 0; ang4 = 30;
%ang1 = 30; ang2 = 45; ang3 = 0; ang4 = 30; 
ang1 = 30; ang2 = -45; ang3 = 0; ang4 = 30; rsa=1;
IL4_mod; plotlam;plotstr;prntlam;                      % edit IL4_mod.m
IL4_run;                                               % edit IL4_run.m
IL4_opt;                                               % edit IL4_opt.m
%======================================================================
close all;clear all;                          
IL4A_val;                                             % edit IL4A_val.m
IL4A_mod; plotlam;plotstr;prntlam;                    % edit IL4A_mod.m
IL4A_run;                                             % edit IL4A_run.m
IL4A_opt;                                             % edit IL4A_opt.m
%======================================================================
close all;clear all;                     
IL6r_val;                                             % edit IL6r_val.m
IL6r_mod; plotlam;plotstr;prntlam;                    % edit IL6r_mod.m
IL6r_run;                                             % edit IL6r_run.m
IL6r_opt;                                             % edit IL6r_opt.m
%======================================================================
close all;clear all;  
ang1=-45;ang2=45; 
IL4B_mod; plotlam;plotstr;prntlam;                    % edit IL4B_mod.m
IL4B_run;                                             % edit IL4B_run.m
IL4B_opt;                                             % edit IL4B_opt.m
%======================================================================
close all;clear all;           
ang1=-45;ang2=45; 
IL4C_mod; plotlam;plotstr;prntlam;                    % edit IL4C_mod.m
IL4C_run;                                             % edit IL4C_run.m
IL4C_opt;                                             % edit IL4C_opt.m
%======================================================================

%**********************************************************************
