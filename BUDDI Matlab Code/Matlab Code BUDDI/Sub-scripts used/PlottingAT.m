

Emma = length(Pitchtf)/length(XP);

% TRAJECTORY

trajectory3(XP/10,YP/10,ZP,Pitchtf(1:Emma:end,1).*pi/180,Rolltf(1:Emma:end,1).*pi/180,Yawtf(1:Emma:end,1).*pi/180,0.06,5,'BUDDI')

xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')


% PITCH, IDEAL PITCH AND EULER ANGLES

% Time markers of phase

YAT = [3.14 83];

XAT= 1e8.*[3.888 3.935];

timeelapsed = XAT(2)-XAT(1)

figure

subplot(2,1,1);
plot(Pitchtf(:,2),Pitchtf(:,1))
% hold on
% plot(Pitchmt(:,2),Ideal_Pitch_MT)
% hold on
% plot(x_mt,y_mt,'o')
hold on
plot(XAT,YAT,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Pitch (deg)')
legend('Pitch','Manouver Time Period')
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

YAT1 = [21.36 34.98];

XAT1 = 1e8.*[3.888 3.935];

YAT2 = [20.24 1.15];

XAT2 = 1e8.*[3.888 3.935];

climb = YAT1(2)-YAT1(1)

figure

subplot(2,1,1);
plot(Ztf(:,2),Ztf(:,1))
hold on
plot(XAT1,YAT1,'x')
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
plot(XAT2,YAT2,'x')
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
plot(Throttle2tf(:,2),[Throttle2tf(:,1)*0.6]-30)
ylabel('Elevator angle (degrees)')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
legend ('Pitch Angle','Elevator deflection','Normalised Throttle 0-100')
grid on
xlim([timelowervalue timeuppervalue])

% BATTERY

YAT3 = [318.6 324.7];

XAT3 = 1e8.*[3.888 3.935];

currentdrawn = YAT3(2)-YAT3(1)

consumption = currentdrawn/ 1e8.*[3.888 3.935]

figure

plot(Totcurrenttf(:,2),Totcurrenttf(:,1))
hold on
plot(XAT3,YAT3,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Total Current (amps)')
legend('Current','Time Period')
grid on

