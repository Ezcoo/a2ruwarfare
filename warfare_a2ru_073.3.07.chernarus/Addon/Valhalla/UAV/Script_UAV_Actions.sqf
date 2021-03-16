switch((_this select 3)select 0)do
{	
	case 0://switch to active UAV
	{			
		_UAV=Local_PlayerVehicle getVariable "uav_active";
		
		startLoadingScreen [localize "STR_UAV_Title","RscDisplayLoadMission"];
			
		_index=UAV_VehicleTypes find (typeOf _UAV);	
		_dialog=(UAV_VehicleDatas select _index) select 5;
			
		createDialog _dialog;
		
		//see Func_UAV_HandleDialog
	};
	case 1://pick UAV
	{	
		[(_this select 3) select 1,true] call Func_UAV_Transport;
	};
	case 2://drop UAV
	{			
		[Local_PlayerVehicle getVariable "uav_attached",false] call Func_UAV_Transport;
	};
	case 3://disconnect from UAV
	{	
		[Local_PlayerVehicle getVariable "uav_active",false] call Func_UAV_Connection;
	};
	case 4://connect to UAV
	{			
		[(_this select 3) select 1,true] call Func_UAV_Connection;
	};
	case 5://Repair UAV
	{			
		((_this select 3) select 1) spawn Func_UAV_RepairDrone;
	};
};