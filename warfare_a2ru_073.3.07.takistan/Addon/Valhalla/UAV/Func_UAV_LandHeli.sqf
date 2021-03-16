_UAV=_this select 0;

if (_UAV==(Local_PlayerVehicle getVariable "uav_attached")) exitWith {};

if (!canMove _UAV) exitWith
{
	player commandChat localize "STR_UAV_Damaged";
};
	
if (((getPosATL _UAV) select 2)>0.5) then
{
	_status=_UAV getVariable "uav_status_active";
	
	if (!(_status select 0) || ((_status select 1) > time)) exitWith {};
	
	_UAV setVariable ["uav_status_active",[false,0],true];
		
	player commandChat localize "STR_UAV_Landing";
	
	((waypoints _UAV) select 1) setWPPos getPos _UAV;
	deleteWaypoint[group _UAV,1];

	while {(!unitReady _UAV) && (alive _UAV) && (canMove _UAV)} do
	{
		sleep 1;
	};
		
	_UAV land "land";

	while {(((getPosATL _UAV) select 2)>5)} do
	{
		sleep 1;
	};
	
	(driver _UAV) action ["engineOff",_UAV];
}
else
{
	_status=_UAV getVariable "uav_status_active";
	
	if (_status select 0) exitWith {};
	
	if (_UAV call Func_UAV_CheckPilot) then
	{
		player commandChat localize "STR_UAV_TakingOff";
		
		_UAV setVariable ["uav_status_active",[true,time+20],true];	
		
		_way=(group _UAV) addWaypoint [getPos _UAV,500,1];
		_way setWaypointBehaviour "careless";
		_way setWaypointCombatMode "blue";
		_way setWaypointType "HOLD";
		_UAV setFuel 1;
			
		(driver _UAV) action ["engineOn",_UAV];
	};
};