clear all
close all

%% IMPORT LOG FILE INTO THE WORKSPACE

load('00000089.BIN-2482309.mat') % Log file transformed by Mission Planner


%% HARDCODE VALUES of INTEREST within the TIME PERIOD SPECIFIED

% SELECT TIME PERIOD by uncommenting : In this case TAKE - OFF



% TAKEOFF 

% timelowervalue = 2.297180e8  - 0.05e8; 

% timeuppervalue = 2.3611e8 + 0.03e8; % as Time is in miliseconds  

% TAKE_OFF TRAJECTORY; same time period but zoomed [use to obtain trajectory plot]

% timelowervalue = 2.312e8 + 0.0013e8;
% 
% timeuppervalue = 2.361e8+0.008e8;




% TRANS In MANUAL

timelowervalue = 5.144429e8 - 0.02e8;
% 
timeuppervalue = 5.1555049e8  + 0.03e8;  % as Time is in miliseconds
 
% TRANS In MANUAL_TRAJECTORY 

% timelowervalue = 5.144429e8;
% 
% timeuppervalue = 5.1555049e8  + 0.008e8;  




% TRANS In AUTO 

% timelowervalue = 3.8878211e8  - 0.04e8;
% 
% timeuppervalue = 3.947455e8; %+ 0.03e8;  % as Time is in miliseconds

% % TRANS In AUTO_TRAJECTORY 

% timelowervalue = 3.8878211e8 ;
% 
% timeuppervalue = 3.947455e8-0.01e8; 




% HOVER

% timelowervalue = 1.40327e9  - 0.02e8;
% 
% timeuppervalue = 1.4865e9  + 0.013e8;  % as Time is in miliseconds

% HOVER_TRAJECTORY 

% timelowervalue = 1.40327e9 ;% - 0.02e8;
% 
% timeuppervalue = 1.4865e9 ;% + 0.013e8;  




% TRANS OUT of HOVER  

% timelowervalue = 4.6e8;% - 0.02e8;
% 
% timeuppervalue = 5e8;  % as Time is in miliseconds

% TRANS OUT of HOVER 
% 
% timelowervalue = 4.6e8;
% 
% timeuppervalue = 5e8;  



Sophie = 1000000000; % Number of iterations set in for loops  

TimePeriodReadInValues % Matlab Script to read Position, Attitude, Airspeed, Mode, Inertial Measurements, Throttle and control surfaces deflections


% OBTAIN CONTROL SURFACES DEFLECTION IN DEGREES

ActuatorDeflectionAngleCalculator % Matlab Script to obtain Control surfaces deflection


%% PLOT FIGURES OF INTEREST


% OBTAIN IDEAL TAKE-OFF PITCH FROM ATITUDE GRAPHS

% [ Only used for an specific Take-off figure, comment for other phases ]

IdealPitchTK % Matlab Script that outputs ideal Pitch wrt Time based on Take-off pitch  



% SELECT MATLAB SCRIPT ACCORDING to the phase selected in the TIME PERIOD selection


% PlottingTK % Take-off

 PlottingMT % Manual Trans into Hover

% PlottingAT % Auto Trans into Hover

% PlottingH % Hover 

% PlottingTO % Transition Out of Hover














