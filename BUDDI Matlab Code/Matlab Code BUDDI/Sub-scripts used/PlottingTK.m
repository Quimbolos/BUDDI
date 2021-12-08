

% As time is read differently for Attitude and position Measurements, there are more attitude values than position values for the same time period. 
% Therfore, Emma is the step used in attitude read in to have same number of elements as position matrices.

Emma = length(Pitchtf)/length(XP); 

% TRAJECTORY - Using trajectory3 function

trajectory3(XP,YP,ZP,Pitchtf(1:Emma:end,1).*pi/180,Rolltf(1:Emma:end,1).*pi/180,Yawtf(1:Emma:end,1).*pi/180,0.1,5,'BUDDI')

xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')


% PITCH, IDEAL PITCH AND EULER ANGLES

% Time markers of phase

YTK = [86.06 0.77];

XTK = 1e8.*[2.297 2.361];

timeelapsed = XTK(2)-XTK(1)

figure

subplot(2,1,1);
plot(Pitchtf(:,2),Pitchtf(:,1))
hold on
plot(Pitchtk(:,2),Ideal_Pitch_TKoff)
hold on
plot(XTK,YTK,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Pitch (deg)')
legend('Pitch','Ideal Pitch Transition','Manouver Time Period')
grid on

subplot(2,1,2);
plot(Pitchtf(:,2),Pitchtf(:,1))
hold on
plot(Pitchtf(:,2),Rolltf(:,1))
hold on
plot(Pitchtf(:,2),Yawtf(:,1))
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Euler Angle (deg)')
legend('Pitch','Roll','Yaw')
grid on


% Z POS & AIRSPEED

YTK1 = [10.45 40.56];

XTK1 = 1e8.*[2.297 2.361];

YTK2 = [2.19 20];

XTK2 = 1e8.*[2.297 2.361];

climb = YTK1(2)-YTK1(1)

figure

subplot(2,1,1);
plot(Ztf(:,2),Ztf(:,1))
hold on
plot(XTK1,YTK1,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Z (m)')
legend('Z Position','Time Period')
grid on

subplot(2,1,2);
plot(Airspeedtf(:,2),Airspeedtf(:,1))
hold on
plot(XTK2,YTK2,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Air Speed (m/s)')
legend('Airspeed','Time Period')
grid on


% CONTROL AUTHORITY

figure

yyaxis left
plot(Pitchtf(:,2),Pitchtf(:,1))
xlabel('Time (\mus)')
ylabel('Pitch angle (degrees)')
yyaxis right
plot(Elevatortf(:,2),Elevatortf(:,1))
hold on
plot(Throttle2tf(:,2),[Throttle2tf(:,1)*0.8]-30)
ylabel('Elevator angle (degrees)')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
legend ('Pitch Angle','Elevator deflection','Normalised Throttle 0-100')
grid on
xlim([timelowervalue timeuppervalue])

% BATTERY

YTK3 = [10.84 52.22];

XTK3 = 1e8.*[2.297 2.361];

currentdrawn = YTK3(2)-YTK3(1)

figure

plot(Totcurrenttf(:,2),Totcurrenttf(:,1))
hold on
plot(XTK3,YTK3,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Total Current (amps)')
legend('Current','Time Period')
grid on

