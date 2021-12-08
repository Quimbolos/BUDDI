

Emma = length(Pitchtf)/length(XP);

% TRAJECTORY

trajectory3(XP/10,YP/10,ZP,Pitchtf(1:Emma:end,1).*pi/180,Rolltf(1:Emma:end,1).*pi/180,Yawtf(1:Emma:end,1).*pi/180,0.07,2,'BUDDI')

xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')


% PITCH, IDEAL PITCH AND EULER ANGLES

% Time markers of phase

YMT = [12.18 91.47];

XMT = 1e8.*[5.148 5.155];

timeelapsed = XMT(2)-XMT(1)

figure

subplot(2,1,1);
plot(Pitchtf(:,2),Pitchtf(:,1))
% hold on
% plot(Pitchmt(:,2),Ideal_Pitch_MT)
% hold on
% plot(x_mt,y_mt,'o')
hold on
plot(XMT,YMT,'x')
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

YMT1 = [12.04 14.2];

XMT1 = 1e8.*[5.148 5.155];

YMT2 = [15.72 4.459];

XMT2 = 1e8.*[5.148 5.155];

climb = YMT1(2)-YMT1(1)

figure

subplot(2,1,1);
plot(Ztf(:,2),Ztf(:,1))
hold on
plot(XMT1,YMT1,'x')
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
plot(XMT2,YMT2,'x')
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
xlabel('Time (ms)')
ylabel('Pitch angle (degrees)')
yyaxis right
plot(Elevatortf(:,2),Elevatortf(:,1)*0.91)
hold on
plot(Throttle2tf(:,2),[Throttle2tf(:,1)*0.7]-30)
ylabel('Elevator angle (degrees)')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
legend ('Pitch Angle','Elevator deflection','Normalised Throttle 0-100')
grid on
xlim([timelowervalue timeuppervalue])

% BATTERY

YMT3 = [608.3 611];

XMT3 = 1e8.*[5.148 5.155];

currentdrawn = YMT3(2)-YMT3(1)

figure

plot(Totcurrenttf(:,2),Totcurrenttf(:,1))
hold on
plot(XMT3,YMT3,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Total Current (amps)')
legend('Current','Time Period')
grid on

