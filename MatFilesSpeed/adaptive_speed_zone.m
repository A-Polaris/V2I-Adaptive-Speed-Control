function[positionManagement,simValues,simParams]=adaptive_speed_zone(positionManagement,simParams,simValues,appParams)
%% 这个函数会先判断zone拥挤程度在决定速度变化
simValues.v = simParams.vMean./3.6;
simValues.vReal = simParams.vMean; 
