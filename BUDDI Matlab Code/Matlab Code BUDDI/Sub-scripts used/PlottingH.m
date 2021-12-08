

Emma = length(Pitchtf)/length(XP);

% TRAJECTORY

trajectory3(XP/10,YP/10,ZP,Pitchtf(1:Emma:end,1).*pi/180,Rolltf(1:Emma:end,1).*pi/180,Yawtf(1:Emma:end,1).*pi/180,0.05,55,'BUDDI')

xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')


% PITCH, IDEAL PITCH AND EULER ANGLES

% Time markers of phase

YH = [90 90];

XH= 1e9.*[1.4115 1.486];

timeelapsed = XH(2)-XH(1)

% Pitch Error 

% Select Time period to compare pitch

timelowervalueH = 1.4115e9;

timeuppervalueH = 1.486e9;

counter = 1;

for i = 1:Sophie
    
    if Pitchtf(i,2) > timelowervalueH 
        
        PitchH(counter,1) = Pitchtf(i,1);
        PitchH(counter,2) = Pitchtf(i,2);
        
        if PitchH(counter,2) > timeuppervalueH
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end

% Create Ideal Values

IdealPitchH = 90.* ones(length(PitchH),1);

% Calulate MEAN ABSOLUTE ERROR

absErrH = norm(PitchH(:,1)-IdealPitchH(:),1);
maeH = absErrH/length(IdealPitchH(:))



figure

subplot(2,1,1);
plot(Pitchtf(:,2),Pitchtf(:,1))
hold on
plot(PitchH(:,2),IdealPitchH)
% hold on
% plot(x_mt,y_mt,'o')
hold on
plot(XH,YH,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Pitch (deg)')
legend('Pitch','Ideal Pitch','Manouver Time Period')
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


% Z POS vs Throttle

figure

YH1  = [12.47 10.9];

XH1 = 1e9.*[1.412 1.486];

yyaxis left
plot(Ztf(:,2),Ztf(:,1))
hold on
plot(XH1,YH1,'x')
xlabel('Time (\mus)')
ylabel('Z (m)')
yyaxis right
plot(Throttle2tf(:,2),Throttle2tf(:,1))
ylabel('Throttle')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
legend ('Z position','Time Period','Throttle 0-100')
grid on
xlim([timelowervalue timeuppervalue])




% BATTERY

YH2 = [1475 1782.5];

XH2 = 1e9.*[1.4115 1.486];

currentdrawn = YH2(2)-YH2(1)

currentconsumption = currentdrawn/(timeelapsed/1000) 

figure

plot(Totcurrenttf(:,2),Totcurrenttf(:,1))
hold on
plot(XH2,YH2,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalue timeuppervalue])
xlabel('Time (\mus)')
ylabel('Total Current (amps)')
legend('Current','Time Period')
grid on

