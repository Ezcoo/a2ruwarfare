	private["_param"];
	
	_param=_this select 0;	
	
	if (_param) then
	{					
		Local_PlayerVehicle=vehicle player;		
		if (Local_PlayerVehicle isKindOf "ParachuteBase") exitWith {Local_PlayerVehicle=player};
		
		_action=Local_PlayerVehicle  addAction ["<t color='#FFBD4C'>"+(localize "STR_ACT_IgnitionOff")+"</t>","Addon\Valhalla\Client\Script_Client_Actions.sqf",[25],98,false,true,"","(player in [driver _target, gunner _target, commander _target]) && !(_target getVariable ['ignition_off',false]) && ((getNumber(configFile >> 'CfgVehicles' >> typeOf _target >> 'Turrets' >> 'MainTurret' >> 'StartEngine')>0) || (getNumber(configFile >> 'CfgVehicles' >> typeOf _target >> 'Turrets' >> 'ObsTurret' >> 'StartEngine')>0)) && !(_target isKindOf 'Air')"];
		Local_PlayerVehicle setVariable ["DAO_WF_ACT_IgnitionOff",_action];
		_action=Local_PlayerVehicle  addAction ["<t color='#FFBD4C'>"+(localize "STR_ACT_IgnitionOn")+"</t>","Addon\Valhalla\Client\Script_Client_Actions.sqf",[26],98,false,true,"","(player in [driver _target, gunner _target, commander _target]) && (_target getVariable ['ignition_off',false])"];
		Local_PlayerVehicle setVariable ["DAO_WF_ACT_IgnitionOn",_action];		
		_action=Local_PlayerVehicle  addAction ["<t color='#FFF37A'>"+(localize "STR_ACT_RadarGuidanceOff")+"</t>","Addon\Valhalla\Client\Script_Client_Actions.sqf",[29],97,false,true,"","(player==gunner _target) && (Local_RadarGuidanceOn) && (canFire _target)"];
		Local_PlayerVehicle setVariable ["DAO_WF_ACT_RadarGuidanceOff",_action];
		_action=Local_PlayerVehicle  addAction ["<t color='#FFF37A'>"+(localize "STR_ACT_RadarGuidanceOn")+"</t>","Addon\Valhalla\Client\Script_Client_Actions.sqf",[29],97,false,true,"","(player==gunner _target) && (!Local_RadarGuidanceOn) && (canFire _target) && (({_target isKindOf _x} count System_HaveAARadarVehicleTypes) > 0)"];
		Local_PlayerVehicle setVariable ["DAO_WF_ACT_RadarGuidanceOn",_action];		
		
		//Local_PlayerVehicle addEventHandler ["Fired","_this call Func_System_Fired"];		

		_typeOf=typeOf Local_PlayerVehicle;
		
		if ((_typeOf in System_HaveAARadarVehicleTypes) || (({Local_PlayerVehicle isKindOf _x} count System_HaveDesignatorVehicleTypes)>0)) then
		{
			1365 cutRsc ["RscTargetOverlay","PLAIN",0];
		};
		
		if (_typeOf in UAV_TerminalTypes) then
		{
			[_param] call Func_UAV_UpdateVehicleActions;
		};		
	}
	else
	{		
		_actions=["DAO_WF_ACT_IgnitionOff","DAO_WF_ACT_IgnitionOn","DAO_WF_ACT_RadarGuidanceOff","DAO_WF_ACT_RadarGuidanceOn"];
		
		{
			_action=Local_PlayerVehicle getVariable _x;
			if (format["%1",_action]!="<null>") then
			{
				Local_PlayerVehicle removeAction _action;
			};		
		} forEach _actions;
		
		/*
		if (Local_PlayerVehicle!=player) then
		{
			Local_PlayerVehicle removeAllEventHandlers "Fired";
		};
		*/		
		
		if ((typeOf Local_PlayerVehicle) in UAV_TerminalTypes) then
		{
			[_param] call Func_UAV_UpdateVehicleActions;
		};		
		
		Local_PlayerVehicle=vehicle player;
	};