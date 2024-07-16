function [stationManagement,positionManagement] = computeCollisions (timeManagement,stationManagement,simParams,positionManagement,simValues,appParams,outParams)

v_order_inzone=positionManagement.v_order_inzone;  %% 
distanceReal=positionManagement.distanceReal;%%% Dis
SafeDis=simParams.SafeDis;
positionManagement.InterSpace=zeros(1,simValues.maxID);

%% 
for i = 1:(simValues.maxID-appParams.nRSUs)
    [v_row , v_col] = find(v_order_inzone==i); %
    if v_col~=1 %% 
        previous_v=v_order_inzone(v_row , v_col-1);  %% 
        inter_dis=distanceReal(i, previous_v);    %% 间距
        positionManagement.InterSpace(1,i)=inter_dis;
         if inter_dis<(SafeDis)  %%% 
             stationManagement.NumColli = stationManagement.NumColli+1;
             positionManagement.currentColli=positionManagement.currentColli+1;
         end
    end
end
positionManagement.InterSpace(1,simValues.maxID+1)=sum(positionManagement.InterSpace(1,:))./(simValues.maxID-1);
con=nnz(v_order_inzone(1,:))-1+nnz(v_order_inzone(2,:))-1;
stationManagement.NumAllConnect = stationManagement.NumAllConnect+con;
positionManagement.currentColli=positionManagement.currentColli./con;

time=timeManagement.timeNow;
printCurrentCollRatioToFile(time,stationManagement.activeIDs,positionManagement,outParams);
