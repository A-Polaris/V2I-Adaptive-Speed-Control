function [positionManagement,simValues,simParams]= zone_busy_ratio(positionManagement,simValues,simParams)
NumofZones=simParams.NumofZones;
XvehicleReal= positionManagement.XvehicleReal;
direction=simValues.direction;