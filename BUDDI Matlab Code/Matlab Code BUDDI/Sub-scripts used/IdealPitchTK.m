

% TAKEOFF

% Select points manually to fit a line

y_tk = [85.4 85.4 85.5 85.5 85.6 85.7 85.7 88.57 92.32 88.8 83.01 24.25 0 0 0 0 0];

x_tk = 1e8.*[timelowervalue/1e8 2.257 2.266 2.27 2.28 2.288 2.295 2.301 2.306 2.309 2.312 2.34 2.361 2.37 2.376 2.38 timeuppervalue/1e8];

% Fit a line and get equation

p = polyfit (x_tk,y_tk,6);


% Select Time period to create ideal pitch 

timelowervaluetk = 2.297e8;

timeuppervaluetk = 2.36e8;

counter = 1;

for i = 1:Sophie
    
    if Pitchtf(i,2) > timelowervaluetk 
        
        Pitchtk(counter,1) = Pitchtf(i,1);
        Pitchtk(counter,2) = Pitchtf(i,2);
        
        if Pitchtk(counter,2) > timeuppervaluetk
            
            break
            
        end
        
        counter = counter +1 ;
        
    end
    
end

% Create curve for ideal pitch over selected time period

Ideal_Pitch_TKoff = polyval(p,Pitchtk(:,2));


% Calulate MEAN ABSOLUTE ERROR

absErrtk = norm(Pitchtk(:,1)-Ideal_Pitch_TKoff(:),1);
maetk = absErrtk/length(Ideal_Pitch_TKoff(:))

