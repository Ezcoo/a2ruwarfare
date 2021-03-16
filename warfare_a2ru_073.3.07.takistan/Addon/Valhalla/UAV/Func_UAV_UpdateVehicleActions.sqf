	_param=_this select 0;
	
	if (_param) then
	{	
		_action=Local_PlayerVehicle addAction ["<t color='#2BB8FF'>"+(localize "STR_UAV_CameraUAV")+"</t>","Addon\Valhalla\UAV\Script_UAV_Actions.sqf",[0],94,false,true,"","(alive player) && (!isNull (_target getVariable 'uav_active')) && (alive (_target getVariable 'uav_active')) && (player==driver _target) && ((speed _target) < 5) && (isEngineOn _target)"];//&& (((_target getVariable 'uav_active') emptyPositions 'driver')==0)
		Local_PlayerVehicle setVariable ["DAO_WF_ACT_SwitchToUav",_action];	
		_action=Local_PlayerVehicle addAction ["<t color='#FFF37A'>"+(localize "STR_UAV_DropUAV")+"</t>","Addon\Valhalla\UAV\Script_UAV_Actions.sqf",[2],93,false,true,"","(alive player) && (!isNull (_target getVariable 'uav_attached')) && (player==driver _target) && ((speed _target) < 5)"];
		Local_PlayerVehicle setVariable ["DAO_WF_ACT_DropUav",_action];	
		_action=Local_PlayerVehicle addAction ["<t color='#FF4A3D'>"+(localize "STR_UAV_DisconnectUAV")+"</t>","Addon\Valhalla\UAV\Script_UAV_Actions.sqf",[3],92,false,true,"","(alive player) && (!isNull (_target getVariable 'uav_active')) && (alive (_target getVariable 'uav_active')) && (player==driver _target) && ((speed _target) < 5)"];
		Local_PlayerVehicle setVariable ["DAO_WF_ACT_DisconnectUav",_action];			

		//if (typeOf Local_PlayerVehicle in UAV_TerminalTypes) then
		//{
			[] spawn Func_UAV_ActionManager;
		//};
	}
	else
	{		
		_actions=["DAO_WF_ACT_SwitchToUav","DAO_WF_ACT_DropUav","DAO_WF_ACT_DisconnectUav"];	
		{
			_action=Local_PlayerVehicle getVariable _x;
			if (format["%1",_action]!="<null>") then
			{				
				Local_PlayerVehicle removeAction _action;
			};		
		} forEach _actions;
	};