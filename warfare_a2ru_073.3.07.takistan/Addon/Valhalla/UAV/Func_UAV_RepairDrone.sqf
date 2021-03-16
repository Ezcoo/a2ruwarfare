	//user action: technical service of a UAV drone

	if ((_this getVariable "uav_repair")>=time) exitWith
	{
		[_name,localize "STR_UAV_UnderRepair","Addon\Valhalla\pic\i_repair_f.paa",1.0] call Func_Client_ShowCustomMessage;
	};

	_this setVariable ["uav_repair",time+20,true];
	
	_name=getText (configFile >> "CfgVehicles" >> (typeOf _this) >> "DisplayName");
	[_name,localize "STR_UAV_RepairStarted","Addon\Valhalla\pic\i_repair_s.paa",1.0] call Func_Client_ShowCustomMessage;

	sleep 1;

	//disallow any technical services until process is active
	//see Func_Client_UpdateVehicleActions
	Local_TechnicalService=true;

	for [{_i=0},{(_i<=20) && (getDammage _this>0.04) && (alive _this) && ((_this distance Local_PlayerVehicle) < 15) && (abs(speed _this) < 5) && (abs(speed Local_PlayerVehicle) < 5) && (Local_PlayerVehicle!=player) && (alive player)},{_i=_i+1}] do
	{	
		_dam=((getDammage _this)-0.05) max 0;
		_this setDammage _dam;	
		[_name,format [localize "STR_UAV_RepairProcess",round(100-_dam*100)],"Addon\Valhalla\pic\i_repair_s.paa",1.0] call Func_Client_ShowCustomMessage;
		sleep 1;
	};

	sleep 0.5;

	if (getDammage _this<=0.04) then
	{
		_this setDammage 0;
		
		_str=localize "STR_UAV_RepairFinished";
		//if ((typeOf _this) in System_AircraftVehicleTypes) then {_str=_str+format[localize "STR_HINT_RepairFlares",0,System_AircraftVehicleCM select (System_AircraftVehicleTypes find (typeOf _this))]};
		[_name,_str,"Addon\Valhalla\pic\i_repair_s.paa",1.0] call Func_Client_ShowCustomMessage;
		
		//[_veh,true] call Func_System_ClearFlaresAndSmokes;
	}
	else
	{
		[_name,localize "STR_UAV_RepairFailed","Addon\Valhalla\pic\i_repair_f.paa",1.0] call Func_Client_ShowCustomMessage;
	};

	_this setVariable ["uav_repair",0,true];
	
	//allow all the technical services
	//see Func_Client_UpdateVehicleActions
	Local_TechnicalService=false;	

