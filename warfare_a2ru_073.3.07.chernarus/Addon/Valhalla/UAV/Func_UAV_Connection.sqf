/*UAV activation script*/
_UAV=_this select 0;
_param=_this select 1;//TRUE - activae UAV, FALSE - deactivate

if (isNull _UAV) exitWith {};

if (_param) then
{	
	//connect to uav
	
	//firstly check, if the uav is not currently under control of another terminal
	_activated_by=_UAV getVariable "uav_activated_by";//
	_name=getText (configFile >> "CfgVehicles" >> (typeOf _UAV) >> "DisplayName");		
	
	//if it is - exit
	if (!(isNull _activated_by) && (alive _activated_by)) exitWith 
	{
		[_name,localize "STR_UAV_Busy","Addon\Valhalla\pic\uav_disconnected.paa",1.0] call Func_Client_ShowCustomMessage;
	};
	
	// set flags
	Local_PlayerVehicle setVariable ["uav_active",_UAV,true];//terminal gets connected uav info
	_UAV setVariable ["uav_activated_by",Local_PlayerVehicle,true];//uav gets connected terminl info
	
	//check and set UAV locality
	if (_UAV call Func_UAV_CheckPilot) then
	{
		//if veh is local - proceed		
		[_name,localize "STR_UAV_Сonnected","Addon\Valhalla\pic\uav_connected.paa",1.0] call Func_Client_ShowCustomMessage;
		//remove fuel for planes - they allways try to take off
		if (_UAV isKindOf "plane") then {_UAV setFuel 0};	
		if (_UAV isKindOf "UAV") then {_UAV setFuel 0};	
	}
	else
	{
		if (!canMove _UAV) then
		{
			player commandChat localize "STR_UAV_Damaged";
		};
	};
}
else
{
	//disconnect from uav
	
	//reset flags
	Local_PlayerVehicle setVariable ["uav_active",objNull,true];
	_UAV setVariable ["uav_activated_by",objNull,true];
	
	//delete pilot to make UAV fall down if it is into the air
	_UAV call Func_UAV_DeletePilot;
	//show message
	_name=getText (configFile >> "CfgVehicles" >> (typeOf _UAV) >> "DisplayName");
	[_name,localize "STR_UAV_Disconnected","Addon\Valhalla\pic\uav_disconnected.paa",1.0] call Func_Client_ShowCustomMessage;
};