function [simValues] = DifSpeed(simParams,appParams,simValues)

vMeanMs_Min = simParams.DifSpeed_Min/3.6;                 % Mean allowed Min vehicle speed (m/s)
vMeanMs_Max = simParams.DifSpeed_Max/3.6;                % Mean allowed Max vehicle speed (m/s)
vStDevMs = simParams.vStDev/3.6;                                     % Speed standard deviation (m/s)

if simParams.alldifSp  
    randomN = rand(simValues.maxID,1);  
    simValues.v = abs(vMeanMs_Min + (vMeanMs_Max-vMeanMs_Min).*randomN + vStDevMs.*randn(simValues.maxID,1));   
    simValues.v(1) = vMeanMs_Min;
    simValues.v(end) = vMeanMs_Max;
else  
    simValues.v=zeros(simValues.maxID,1);
    simValues.v(1:simValues.maxID/2,1)=vMeanMs_Min;
    simValues.v(simValues.maxID/2+1:end,1)=vMeanMs_Max;
end
