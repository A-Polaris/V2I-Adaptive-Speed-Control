close all    
clear        
clc          

configFile = 'Highway3GPP_withRSU.cfg';
T = 10;

Folder='Output_SP1';
%% fixed
for rho=[50 100 150 200]
    for speed=20
    WiLabV2Xsim(configFile,'simulationTime',T,'MCS_NR',3,'SCS_NR',15,'beaconSizeBytes',300,...
        'rho',rho,'BwMHz',10,'Raw',150,'BRAlgorithm',18,'generationInterval',0.1,'Ptx_dBm',23,'roadLength',2000,'vStDev',0,'roadWidth',4,'NLanes',1,...
        'Speed_Different',false,'adaSpeed',false,'NumColli',true,'SafeDis',25,'outputFolder',Folder)
    end
end
%% 2 dif
for rho=[50 100 150 200]
 WiLabV2Xsim(configFile,'simulationTime',T,'MCS_NR',3,'SCS_NR',15,'beaconSizeBytes',300,...
            'rho',rho,'BwMHz',10,'Raw',150,'BRAlgorithm',18,'generationInterval',0.1,'Ptx_dBm',23,'roadLength',2000,'vStDev',0,'roadWidth',4,'NLanes',1,...
           'Speed_Different',true,'alldifSp',false,'DifSpeed_Min',30,'DifSpeed_Max',60,...
           'adaSpeed',false,'NumColli',true,'SafeDis',25,'outputFolder',Folder)
end
%% all dif
for rho=[50 100 150 200]
 WiLabV2Xsim(configFile,'simulationTime',T,'MCS_NR',3,'SCS_NR',15,'beaconSizeBytes',300,...
            'rho',rho,'BwMHz',10,'Raw',150,'BRAlgorithm',18,'generationInterval',0.1,'Ptx_dBm',23,'roadLength',2000,'vStDev',0,'roadWidth',4,'NLanes',1,...
           'Speed_Different',true,'alldifSp',true,'DifSpeed_Min',30,'DifSpeed_Max',60,...
           'adaSpeed',false,'NumColli',true,'SafeDis',25,'outputFolder',Folder)
end


