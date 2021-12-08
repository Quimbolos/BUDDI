
% HARDCODE ALL VALUES FROM TIME PERIOD SPECIFIED 

counter = 1;

% GPS DATA

for i = 1:Sophie
    
    if GPS (i,2) > timelowervalue 
        
        Xtf(counter,1) = GPS (i,8);
        Xtf(counter,2) = GPS (i,2);
        
        Ytf(counter,1) = GPS (i,9);
        Ytf(counter,2) = GPS (i,2);
        
        Ztf(counter,1) = GPS (i,10);
        Ztf(counter,2) = GPS (i,2);
        
        if Xtf(counter,2) > timeuppervalue
            
            break
                   
        end
        
        counter = counter +1 ;
        
    end
    
end


% CONVERT Longitude and Latitude into Meters

latp = Xtf (:,1);
lonp = Ytf (:,1);
hp = Ztf (:,1);
GPSTimep = Xtf (:,2);

LAT = (pi/180).*latp;   % Convert degrees into rad

LON = (pi/180).*lonp;

R = 6378.137e3;           % Earth's radius [m]; WGS-84

XP = R * cos(LAT) .* cos(LON);

YP = R * cos(LAT) .* sin(LON);

ZP = hp;

XP = XP - XP(1);  %Establish a relative origin in XY plane

YP = YP - YP(1);


% ARSP DATA

counter = 1;

for i = 1:Sophie
    
    if ARSP(i,2) > timelowervalue 
        
        Airspeedtf(counter,1) = ARSP (i,3);
        Airspeedtf(counter,2) = ARSP (i,2);
        
        if Airspeedtf(counter,2) > timeuppervalue
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end

% MODE DATA


first_val = find(MODE(:,2) > timelowervalue,1,'first') ;
last_val = find(MODE(:,2) > timeuppervalue,1,'first') ;

Modetf(:,1) = MODE(first_val:last_val, 4);
Modetf(:,2) = MODE(first_val:last_val, 2);


% ATT DATA

counter = 1;

for i = 1:Sophie
    
    if ATT(i,2) > timelowervalue 
        
        Pitchtf(counter,1) = ATT (i,6);
        Pitchtf(counter,2) = ATT (i,2);
        
        DesPitchtf(counter,1) = ATT (i,5);
        DesPitchtf(counter,2) = ATT (i,2);
        
        Rolltf(counter,1) = ATT (i,4);
        Rolltf(counter,2) = ATT (i,2);        
        
        DesRolltf(counter,1) = ATT (i,3);
        DesRolltf(counter,2) = ATT (i,2);
        
        Yawtf(counter,1) = ATT (i,8);
        Yawtf(counter,2) = ATT (i,2);
        
        DesYawtf(counter,1) = ATT (i,7);
        DesYawtf(counter,2) = ATT (i,2);
        
        if Pitchtf(counter,2) > timeuppervalue
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end

counter = 1;

check = 0; % Loop above corrects -90 degrees readings in pitch during HOVER state

for i =1:length(Pitchtf(:,2))
    if counter < length(Modetf(:,2))
        if Pitchtf(i,2) >= Modetf(counter,2) && Modetf(counter,1) == 18
            check = 1;
        end
        if Pitchtf(i,2) >= Modetf(counter+1,2) 
           counter = counter + 1;
        end 
        if Modetf(counter,1) ~= 18
            check = 0;
        end
 
        if check == 1
      
            Pitchtf(i) = Pitchtf(i) + 90; 
            Rolltf(i) = Rolltf(i);
            Yawtf(i) = Yawtf(i);
            
            DesPitchtf(i) = DesPitchtf(i) + 90 ;
            DesRolltf(i) = DesRolltf(i);
            DesYawtf(i) = DesYaw(i);
        end
        
    end

end

% IMU DATA

counter = 1;

for i = 1:Sophie
    
    if IMU(i,2) > timelowervalue 
        
        RollRatetf(counter,1) = IMU (i,3);
        RollRatetf(counter,2) = IMU (i,2);
        
        PitchRatetf(counter,1) = IMU (i,4);
        PitchRatetf(counter,2) = IMU (i,2);
        
        Yawratetf(counter,1) = IMU (i,5);
        Yawratetf(counter,2) = IMU (i,2);       
        
        XAcctf(counter,1) = IMU (i,6);
        XAcctf(counter,2) = IMU (i,2);
        
        YAcctf(counter,1) = IMU (i,7);
        YAcctf(counter,2) = IMU (i,2);
        
        ZAcctf(counter,1) = IMU (i,8);
        ZAcctf(counter,2) = IMU (i,2); 
        
        if RollRatetf(counter,2) > timeuppervalue
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end

% CTUN DATA

counter = 1;

for i = 1:Sophie
    
    if CTUN(i,2) > timelowervalue 
        
        Throttletf(counter,1) = AETR (i,7);
        Throttletf(counter,2) = AETR (i,2);
        
        if Throttletf(counter,2) > timeuppervalue
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end

% AETR DATA

counter = 1;

for i = 1:Sophie
    
    if AETR(i,2) > timelowervalue 
        
        Ailerontf(counter,1) = AETR (i,3);
        Ailerontf(counter,2) = AETR (i,2);
        
        Elevatortf(counter,1) = AETR (i,4);
        Elevatortf(counter,2) = AETR (i,2);
        
        Throttle2tf(counter,1) = AETR (i,5);
        Throttle2tf(counter,2) = AETR (i,2);     
        
        Ruddertf(counter,1) = AETR (i,6);
        Ruddertf(counter,2) = AETR (i,2);
        
        Flaptf(counter,1) = AETR (i,7);
        Flaptf(counter,2) = AETR (i,2);
        
        if Ailerontf(counter,2) > timeuppervalue
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end

% BAT DATA

counter = 1;

for i = 1:Sophie
    
    if BAT(i,2) > timelowervalue 
        
        Currenttf(counter,1) = BAT (i,5);
        Currenttf(counter,2) = BAT (i,2);
        
        Totcurrenttf(counter,1) = BAT (i,6);
        Totcurrenttf(counter,2) = BAT (i,2);
   
        
        if Currenttf(counter,2) > timeuppervalue
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end


% Hardcode Step Mode

j = 100000;

counter = 3;

counter2 = 2;

MODETimetf = Modetf (:,2);

for i=2:2:size(Modetf)
    
    StepModetf (i,1) = Modetf (counter2-1,1);
    
    StepModetf (i,2) = MODETimetf (counter2,1);
    
    StepModetf (counter,1) = Modetf (counter2,1);
    
    StepModetf (counter,2) = MODETimetf (counter2,1);
    
    counter = counter + 2;
    
    counter2 = counter2 +1;
    
end




