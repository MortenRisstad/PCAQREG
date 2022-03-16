function [out] = VaRLossFunction(tau, r, est, tail, lossFun, betaC)

%% computes Value-at-Risk loss function as described in
% Abad et al. (2015): The role of the loss function in value-at-risk comparisons, Journal of Risk Model Validation
% Prefix R: Regulator's loss function. Prefix F: Firm's loss function
% QL: quadratic Lopez, L: lineal, Q: quadratic, C_1: Caporin1, C_2:
% Caporin2, C_3: Caporin3, FS: Sarma, FABL: Abad etal, 

% Also; ALOSS: Assymmtric lossGonz´alez-Rivera G, Lee TH, Mishra S (2004). 
%“Forecasting volatility: A reality check based on option pricing, utility function, value-at-risk, 
%and predictive likelihood.” International Journal of Forecasting

RQL = 0; RL=0; RQ=0; RC_1=0; RC_2 = 0; RC_2=0; RC_3=0; FS=0; FC_1=0; FC_2 = 0;  FC_3 = 0; FABL=0; ALOSS=0;

FC_1    = abs(1-abs(r/est));
FC_2    = (abs(r)-(abs(est)^2)) / abs(est);
FC_3    = abs(est-r);

switch tail
    case 1         
        if r < est
            RQL     = 1+((-est+r)^2);
            RL      = (-est-r);
            RQ      = (est-r)^2;
            RC_1    = abs(1 - abs(r/est));
            RC_2    = ((abs(r)-abs(est))^2)/abs(est);
            RC_3    = abs(-est-r);
            FS      = (est - r)^2; 
            FABL    = (est - r)^2;
            ALOSS   = abs((tau -1) * abs(est - r));
            %ALOSS   = ((tau -1) * (est - r));
        end
        
        if r > est
            FS      = -betaC*est;
            FABL    = betaC*(abs(r-est));
            ALOSS   = (tau) * abs(est - r);
        end
        
    case 2
        if r > est
            RQL     = 1+((-est+r)^2);
            RL      = (-est+r);
            RQ      = (-est+r)^2;
            RC_1    = abs(1 - abs(r/est));
            RC_2    = ((abs(r)-abs(est))^2)/abs(est);
            RC_3    = abs(-est+r);
            FS      = (-est + r)^2; 
            FABL    = (-est + r)^2;
            ALOSS   = abs((tau -1) * (-est + r));
            %ALOSS   = ((tau -1) * (-est + r));
        end
        
        if r < est
            FS      = betaC*est;
            FABL    = betaC*(abs(est-r));
            ALOSS   = (tau) * abs(est - r);
        end
end


switch lossFun
    case 'FC_1'
       out =FC_1;
    case 'FC_2'
       out =FC_2;
    case 'FC_3'
       out =FC_3;
    case 'RQL'
       out =RQL;
    case 'RL'
       out =RL;
    case 'RQ'
       out =RQ;
    case 'RC_1'
       out =RC_1;
    case 'RC_2'
       out =RC_2;
    case 'RC_3'
       out =RC_3;
    case 'FS'
       out =FS;
    case 'FABL'
       out =FABL;
    case 'ALOSS'
       out =ALOSS;
       
end

%out.FC_1=FC_1;
%out.FC_2=FC_2;
%out.FC_3=FC_3;
%out.RQL=RQL;
%out.RL=RL;
%out.RQ=RQ;
%out.RC_1=RC_1;
%out.RC_2=RC_2;
%out.RC_3=RC_3;
%out.FS=FS;
%out.FABL=FABL;

end

