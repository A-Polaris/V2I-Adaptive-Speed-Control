function [positionManagement,simValues,simParams]= VehicleOrder(positionManagement,simValues,simParams)
XvehicleReal= positionManagement.XvehicleReal;
direction=simValues.direction;
positionManagement.v_order_inzone_0right=[];
positionManagement.v_order_inzone_1left=[];

v_order_inzone_0right=[];
v_order_inzone_1left=[];

XvehicleReal(positionManagement.RSUid)=[];
direction(positionManagement.RSUid)=[];

%%
id0=find(direction==0);
d0=XvehicleReal(id0); %% 朝右right
[v_real_value0,v_real_index0] = sort(d0,1);
v_order0=id0(v_real_index0);
v_order_inzone_0right=v_order0;
positionManagement.v_order_inzone_0right=v_order_inzone_0right;

id1=find(direction==1);
d1=XvehicleReal(id1); %% 朝左lest
[v_real_value0,v_real_index1] = sort(d1,1);
v_order1=id1(v_real_index1);
v_order_inzone_1left=v_order1;
positionManagement.v_order_inzone_1left=v_order_inzone_1left;

%%
v_order_inzone_0right(v_order_inzone_0right(:,:)==0)=[];  
v_order_inzone_0right=flip(v_order_inzone_0right);%%%
v_order_inzone_1left(v_order_inzone_1left(:,:)==0)=[];

if length(v_order_inzone_0right(:,1))>1
    v_order_inzone_0right=v_order_inzone_0right';
end
if length(v_order_inzone_1left(:,1))>1
    v_order_inzone_1left=v_order_inzone_1left';
end
  l=max([length(v_order_inzone_0right),length(v_order_inzone_1left)]);
  D=[padarray(v_order_inzone_0right,[0 l-length(v_order_inzone_0right) ],'post') ;...
            padarray(v_order_inzone_1left,[0 l-length(v_order_inzone_1left) ],'post')];
   positionManagement.v_order_inzone=D;