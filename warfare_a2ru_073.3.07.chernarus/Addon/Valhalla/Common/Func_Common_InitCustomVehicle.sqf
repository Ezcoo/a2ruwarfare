	//vehicle type, cost, idle time
	//see Func_Dialog_HandleVehiclesDialog
	private["_veh","_type","_isuav","_isterminal","_init","_handler"];
	
	_veh=_this select 0;	
	_type=typeOf _veh;

	_isuav=false;
	_isterminal=false;

	/*UAV Module Code*/		
	_isuav=(_type in UAV_VehicleTypes);
	_isterminal=(_type in UAV_TerminalTypes);
	/*END UAV Module Code*/
	
	//_aawarning=(_type in System_AircraftVehicleTypes);
	_atwarning=(_type in System_ArmoredVehicleTypes);	

	//setting ammount of repairkits inside
	//_veh setVariable ["rpair_kits",Config_RepairKitsDefault,true];	
	
	_veh setVariable ["fieldrepair",0,true];//vehicle is not being under field repair; see Func_Client_FieldRepairs	
	_veh setVariable ["ignition_off",false,true];//for tanks: wether ignition is on or off	
	
	//remove default smoke and flare launchers
	[_veh,true] call Func_System_ClearFlaresAndSmokes;	

	//prepare vehicle init
	//by default it has only award system
	_init="";
	_handler="";
	
	//AT
	if (_veh isKindOf "LandVehicle") then
	{			
		_handler=_handler+format["if ((_this select 1) in System_AntiTankMissileTypes) then {[_this select 0,_this select 1,_this select 2,%1] spawn Func_System_IncomingATMissile};",_atwarning];
	};		
	
	_init=_init+format["this addEventHandler ['incomingmissile','%1'];",_handler];
	
	//ablility so switch ignition off for tanks
	if ((getNumber(configFile >> 'CfgVehicles' >> _type >> 'Turrets' >> 'MainTurret' >> 'StartEngine')>0) || (getNumber(configFile >> 'CfgVehicles' >> _type >> 'Turrets' >> 'ObsTurret' >> 'StartEngine')>0)) then
	{
		_init=_init+"this addEventHandler ['engine','_this call Func_Common_SwitchIgnition'];";
	};
		
	/*UAV Module Code*/	
	if (_isuav) then
	{
		[_veh] call Func_UAV_InitDrone;
	}
	else
	{
		if (_isterminal) then
		{
			[_veh] call Func_UAV_InitTerminal;
		};
	};
	/*END UAV Module Code*/
	
	//run vehicle init
	_veh setVehicleInit _init;
	processInitCommands;	
	