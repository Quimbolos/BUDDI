
% ACTUATORs DEFLECTION ANGLE CALCULATOR

% It uses linear interpolation to convert deflections from log data [in the
% ±4500 domain]
% to actual measured control surfaces deflection in degrees.

% *
% *
% *
% *
% *

% ELEVATOR


% POSITIVE Moment Data (Elevator Going Up)

Y1_E_pos = -257;

Y2_E_pos = 4427;

X1_E_pos = 0;

X2_E_pos = 30;

M_E_pos = (Y2_E_pos-Y1_E_pos)/(X2_E_pos-X1_E_pos);

N_E_pos = (Y2_E_pos)-(M_E_pos*X2_E_pos);


% NEGATIVE Moment Data (Elevator Going Down)

Y1_E_neg = -257;

Y2_E_neg = -4500;

X1_E_neg = 0;

X2_E_neg = -30;

M_E_neg = (Y2_E_neg-Y1_E_neg)/(X2_E_neg-X1_E_neg);

N_E_neg = (Y2_E_neg)-(M_E_neg*X2_E_neg);



% Substitute values for the Time Period Specified

for i = 1:length(Elevatortf)
 
    if Elevatortf(i)<= -257
        DEFLECTION_E_pos = (Elevatortf(i)-N_E_pos)/M_E_pos;
        Elevatortf(i) = DEFLECTION_E_pos;
    else
        DEFLECTION_E_neg = (Elevatortf(i)-N_E_neg)/M_E_neg;
        Elevatortf(i) = DEFLECTION_E_neg;
    end

end



% *
% *
% *
% *
% *

% RUDDER


% POSITIVE Moment Data (Rudder Going Right)

Y1_R_pos = -17;

Y2_R_pos = 4500;

X1_R_pos = 0;

X2_R_pos = 25;

M_R_pos = (Y2_R_pos-Y1_R_pos)/(X2_R_pos-X1_R_pos);

N_R_pos = (Y2_R_pos)-(M_R_pos*X2_R_pos);

DEFLECTION_R_pos = (4500-N_R_pos)/M_R_pos;


% NEGATIVE Moment Data (Rudder Going Left)

Y1_R_neg = -17;

Y2_R_neg = -4500;

X1_R_neg = 0;

X2_R_neg = -25;

M_R_neg = (Y2_R_neg-Y1_R_neg)/(X2_R_neg-X1_R_neg);

N_R_neg = (Y2_R_neg)-(M_R_neg*X2_R_neg);

DEFLECTION_R_neg = (-4500-N_R_neg)/M_R_neg;


for i = 1:length(Ruddertf)
 
    if Ruddertf(i)>= -17
        DEFLECTION_R_pos = (Ruddertf(i)-N_R_pos)/M_R_pos;
        Ruddertf(i) = DEFLECTION_R_pos;
    else
        DEFLECTION_R_neg = (Ruddertf(i)-N_R_neg)/M_R_neg;
        Ruddertf(i) = DEFLECTION_R_neg;
    end

end


% *
% *
% *
% *
% *

% AILERONS 

% POSITIVE Moment Data (Left Aileron Down / Right Aileron Up)

Y1_A_pos = 72;

Y2_A_pos = -4429;

X1_Ar_pos = 0;

X2_Ar_pos = 45;

X1_Al_pos = 0;

X2_Al_pos = -35;

M_Ar_pos = (Y2_A_pos-Y1_A_pos)/(X2_Ar_pos-X1_Ar_pos);

N_Ar_pos = (Y2_A_pos)-(M_Ar_pos*X2_Ar_pos);

M_Al_pos = (Y2_A_pos-Y1_A_pos)/(X2_Al_pos-X1_Al_pos);

N_Al_pos = (Y2_A_pos)-(M_Al_pos*X2_Al_pos);

DEFLECTION_Ar_pos = (-4429-N_Ar_pos)/M_Ar_pos;

DEFLECTION_Al_pos = (-4429-N_Al_pos)/M_Al_pos;


% NEGATIVE Moment Data (Left Aileron Up / Right Aileron Down)


Y1_A_neg = 72;

Y2_A_neg = 4500;

X1_Ar_neg = 0;

X2_Ar_neg = -35;

X1_Al_neg = 0;

X2_Al_neg = 45;

M_Ar_neg = (Y2_A_neg-Y1_A_neg)/(X2_Ar_neg-X1_Ar_neg);

N_Ar_neg = (Y2_A_neg)-(M_Ar_neg*X2_Ar_neg);

M_Al_neg = (Y2_A_neg-Y1_A_neg)/(X2_Al_neg-X1_Al_neg);

N_Al_neg = (Y2_A_neg)-(M_Al_neg*X2_Al_neg);

Aileron_lefttf = zeros(length(Ailerontf));

Aileron_righttf = zeros(length(Ailerontf));


for i = 1:length(Ailerontf)
 
    if Ailerontf(i)>= 72
        
        DEFLECTION_Ar_pos = (Ailerontf(i)-N_Ar_pos)/M_Ar_pos;
        DEFLECTION_Al_pos = (Ailerontf(i)-N_Al_pos)/M_Al_pos;
        
        Aileron_lefttf(i) = DEFLECTION_Al_pos;
        Aileron_righttf(i) = DEFLECTION_Ar_pos;
        
    else
        
        DEFLECTION_Ar_neg = (Ailerontf(i)-N_Ar_neg)/M_Ar_neg;
        DEFLECTION_Al_neg = (Ailerontf(i)-N_Al_neg)/M_Al_neg;
        
        Aileron_lefttf(i) = DEFLECTION_Al_neg;
        Aileron_righttf(i) = DEFLECTION_Ar_neg;
        
    end

end




