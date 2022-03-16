function [out] = VaRLosses(OOSrets,tauVec, VaREst, betaC)

out = struct;

for i=1:size(OOSrets,1)

    FC_1(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'FC_1',betaC);    
    FC_1(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'FC_1',betaC);    
    FC_1(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'FC_1',betaC);    
    FC_1(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'FC_1',betaC);    
    FC_1(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'FC_1',betaC);    
    FC_1(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'FC_1',betaC);  
    
    FC_2(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'FC_2',betaC);    
    FC_2(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'FC_2',betaC);    
    FC_2(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'FC_2',betaC);    
    FC_2(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'FC_2',betaC);    
    FC_2(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'FC_2',betaC);    
    FC_2(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'FC_2',betaC); 
    
    FC_3(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'FC_3',betaC);    
    FC_3(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'FC_3',betaC);    
    FC_3(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'FC_3',betaC);    
    FC_3(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'FC_3',betaC);    
    FC_3(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'FC_3',betaC);    
    FC_3(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'FC_3',betaC);  
    
    RQL(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'RQL',betaC);    
    RQL(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'RQL',betaC);    
    RQL(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'RQL',betaC);    
    RQL(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'RQL',betaC);    
    RQL(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'RQL',betaC);    
    RQL(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'RQL',betaC);  
    
    RL(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'RL',betaC);    
    RL(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'RL',betaC);    
    RL(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'RL',betaC);    
    RL(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'RL',betaC);    
    RL(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'RL',betaC);    
    RL(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'RL',betaC); 
    
    RQ(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'RQ',betaC);    
    RQ(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'RQ',betaC);    
    RQ(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'RQ',betaC);    
    RQ(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'RQ',betaC);    
    RQ(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'RQ',betaC);    
    RQ(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'RQ',betaC); 
    
    RC_1(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'RC_1',betaC);    
    RC_1(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'RC_1',betaC);    
    RC_1(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'RC_1',betaC);    
    RC_1(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'RC_1',betaC);    
    RC_1(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'RC_1',betaC);    
    RC_1(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'RC_1',betaC); 
    
    RC_2(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'RC_2',betaC);    
    RC_2(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'RC_2',betaC);    
    RC_2(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'RC_2',betaC);    
    RC_2(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'RC_2',betaC);    
    RC_2(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'RC_2',betaC);    
    RC_2(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'RC_2',betaC); 
    
    RC_3(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'RC_3',betaC);    
    RC_3(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'RC_3',betaC);    
    RC_3(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'RC_3',betaC);    
    RC_3(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'RC_3',betaC);    
    RC_3(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'RC_3',betaC);    
    RC_3(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'RC_3',betaC); 
    
    FS(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'FS',betaC);    
    FS(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'FS',betaC);    
    FS(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'FS',betaC);    
    FS(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'FS',betaC);    
    FS(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'FS',betaC);    
    FS(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'FS',betaC); 
    
    FABL(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'FABL',betaC);    
    FABL(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'FABL',betaC);    
    FABL(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'FABL',betaC);    
    FABL(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'FABL',betaC);    
    FABL(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'FABL',betaC);    
    FABL(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'FABL',betaC); 
    
    ALOSS(i,1)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,1),1,'ALOSS',betaC);    
    ALOSS(i,2)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,2),1,'ALOSS',betaC);    
    ALOSS(i,3)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,3),1,'ALOSS',betaC);    
    ALOSS(i,4)=VaRLossFunction(tauVec(3), OOSrets(i), VaREst(i,4),2,'ALOSS',betaC);    
    ALOSS(i,5)=VaRLossFunction(tauVec(2), OOSrets(i), VaREst(i,5),2,'ALOSS',betaC);    
    ALOSS(i,6)=VaRLossFunction(tauVec(1), OOSrets(i), VaREst(i,6),2,'ALOSS',betaC); 








end

out.FC_1 = FC_1;
out.FC_2 = FC_2;
out.FC_3 = FC_3;
out.RQL = RQL;
out.RL = RL;
out.RQ = RQ;
out.RC_1 = RC_1;
out.RC_2 = RC_2;
out.RC_3 = RC_3;
out.FS = FS;
out.FABL = FABL;
out.ALOSS = ALOSS;

end

