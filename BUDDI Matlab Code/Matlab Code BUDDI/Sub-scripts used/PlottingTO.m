

% TRAJECTORY

% Because code only detects pitch error if time is taken from before the
% transition in, another selection need to be taken for actual Transition
% Out

% Hardcode Euler Angles from actual transition out

timelowervalueTO = 4.86e8 ;% 4.8e8; % 4.856  

timeuppervalueTO = 4.89e8 ;% 4.96e8; % 4.89

counter = 1;

for i = 1:Sophie
    
    if Pitchtf(i,2) > timelowervalueTO 
        
        PitchTO(counter,1) = Pitchtf(i,1);
        PitchTO(counter,2) = Pitchtf(i,2);
        
        RollTO(counter,1) = Rolltf(i,1);
        RollTO(counter,2) = Rolltf(i,2);
        
        YawTO(counter,1) = Yawtf(i,1)+55;
        YawTO(counter,2) = Yawtf(i,2);
       
        
        if PitchTO(counter,2) > timeuppervalueTO
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end

% Hardcode Position from actual transition out

counter = 1;

for i = 1:Sophie
    
    if Xtf(i,2) > timelowervalueTO 
        
        XTO(counter,1) = Xtf (i,1);
        XTO(counter,2) = Xtf (i,2);
        
        YTO(counter,1) = Ytf (i,1);
        YTO(counter,2) = Ytf(i,2);
        
        ZTO(counter,1) = Ztf (i,1);
        ZTO(counter,2) = Ztf (i,2);
       
        
        if XTO(counter,2) > timeuppervalueTO
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end


% CONVERT Longitude and Latitude into Meters

latTO = XTO (:,1);
lonTO = YTO (:,1);
hpTO = ZTO (:,1);
GPSTimeTO = XTO (:,2);

LATTO = (pi/180).*latTO;

LONTO = (pi/180).*lonTO;

R = 6378.137e3;           % Earth's radius [m]; WGS-84

Xto = R * cos(LATTO) .* cos(LONTO);

Yto = R * cos(LATTO) .* sin(LONTO);

Zto = hpTO;

Xto = Xto - Xto(1);

Yto = Yto - Yto(1);

Emma = length(PitchTO)/length(XTO);


trajectory3(Xto(1:1:end),Yto(1:1:end),Zto(1:1:end),PitchTO(1:Emma:end,1).*pi/180,RollTO(1:Emma:end,1).*pi/180,YawTO(1:Emma:end,1).*pi/180,0.4,2,'BUDDI')

xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')


% PITCH, IDEAL PITCH AND EULER ANGLES

% Time markers of phase

YTO = [89.58 -4.35];

XTO = 1e8.*[4.856 4.89];

timeelapsed = XTO(2)-XTO(1)

figure

subplot(2,1,1);
plot(PitchTO(:,2),PitchTO(:,1))
hold on
plot(XTO,YTO,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalueTO timeuppervalueTO])
xlabel('Time (\mus)')
ylabel('Pitch (deg)')
legend('Pitch','Time Period')
grid on

subplot(2,1,2);
plot(PitchTO(:,2),PitchTO(:,1))
hold on
plot(PitchTO(:,2),RollTO(:,1))
hold on
plot(PitchTO(:,2),YawTO(:,1))
xlim([timelowervalueTO timeuppervalueTO])
xlabel('Time (\mus)')
ylabel('Euler Angle (deg)')
legend('Pitch','Roll','Yaw')
grid on



% Hardcode Airspeed from actual transition out

counter = 1;

for i = 1:Sophie
    
    if Airspeedtf(i,2) > timelowervalueTO 
        
        AirspeedTO(counter,1) = Airspeedtf(i,1) ;
        AirspeedTO(counter,2) = Airspeedtf(i,2) ;
      
        if AirspeedTO(counter,2) > timeuppervalueTO
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end

% Z POS & AIRSPEED

YTO1 = [29.93 49.68];

XTO1 = 1e8.*[4.856 4.89];

YTO2 = [4.089 19.42];

XTO2 = 1e8.*[4.856 4.89];

climb = YTO1(2)-YTO1(1)

figure

subplot(2,1,1);
plot(ZTO(:,2),ZTO(:,1))
hold on
plot(XTO1,YTO1,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalueTO timeuppervalueTO])
xlabel('Time (\mus)')
ylabel('Z (m)')
legend('Z Position','Time Period')
grid on

subplot(2,1,2);
plot(AirspeedTO(:,2),AirspeedTO(:,1))
hold on
plot(XTO2,YTO2,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalueTO timeuppervalueTO])
xlabel('Time (\mus)')
ylabel('Air Speed (m/s)')
legend('Airspeed','Time Period')
grid on


% Hardcode Control surfaces from actual transition out

counter = 1;

for i = 1:Sophie
    
    if Ailerontf(i,2) > timelowervalueTO 
        
       
        AileronTO(counter,1) = Ailerontf(i,1);
        AileronTO(counter,2) = Ailerontf(i,2);
        
        ElevatorTO(counter,1) = Elevatortf(i,1); 
        ElevatorTO(counter,2) = Elevatortf(i,2); 
        
        RudderTO(counter,1) = Ruddertf(i,1) ;
        RudderTO(counter,2) = Ruddertf(i,2) ;
        
        Throttle2TO(counter,1) = Throttle2tf(i,1) ;
        Throttle2TO(counter,2) = Throttle2tf(i,2) ;
        
      
        if AileronTO(counter,2) > timeuppervalueTO
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end


% CONTROL AUTHORITY

figure

yyaxis left
plot(PitchTO(:,2),PitchTO(:,1))
hold on
plot(XTO,YTO,'x')
xlabel('Time (\mus)')
ylabel('Pitch angle (degrees)')
yyaxis right
plot(ElevatorTO(:,2),ElevatorTO(:,1))
hold on
plot(Throttle2TO(:,2),[Throttle2TO(:,1)*0.4]-30)
ylabel('Elevator angle (degrees)')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
legend ('Pitch Angle','Time Period','Elevator deflection','Normalised Throttle 0-1000')
grid on
xlim([timelowervalueTO timeuppervalueTO])



% Hardcode total current from actual transition out

counter = 1;

for i = 1:Sophie
    
    if Totcurrenttf(i,2) > timelowervalueTO 
        
        TotcurrentTO(counter,1) = Totcurrenttf(i,1);
        TotcurrentTO(counter,2) = Totcurrenttf(i,2);
      
        if TotcurrentTO(counter,2) > timeuppervalueTO
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end
      

% BATTERY

YTO3 = [561.8 588.2];

XTO3 = 1e8.*[4.856 4.89];

currentdrawn = YTO3(2)-YTO3(1)

figure

plot(TotcurrentTO(:,2),TotcurrentTO(:,1))
hold on
plot(XTO3,YTO3,'x')
% hold on 
% xline(timelowervalue + 0.1e8)
% hold on
% xline (timeuppervalue - 0.1e8)
xlim([timelowervalueTO timeuppervalueTO])
xlabel('Time (\mus)')
ylabel('Total Current (amps)')
legend('Current','Time Period')
grid on

