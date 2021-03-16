_UAV=_this select 0;
_para=_this select 1;
_attachPos=_this select 2;

if (_UAV==(Local_PlayerVehicle getVariable "uav_attached")) exitWith {};

if (!canMove _UAV) exitWith
{
	player commandChat localize "STR_UAV_Damaged";
};	
	
if (((getPosATL _UAV) select 2)>0.5) then
{
	_status=_UAV getVariable "uav_status_active";
	
	if (!(_status select 0) || ((_status select 1) > time)) exitWith {};
		
	player commandChat localize "STR_UAV_Landing";
		
	_UAV setVariable ["uav_status_active",[false,0],true];

	_UAV setFuel 0;
	deleteWaypoint[group _UAV,1];

	_driver=_UAV getVariable "uav_driver";
		
	if ((getNumber(configFile >> 'CfgVehicles' >> typeOf _UAV >> 'gearretracting')==1)) then
	{
		_PitchBank=_UAV call Func_System_GetPitchBank;
	
		//make the UAV to lower gear
		_player=player;
		selectPlayer _driver;		
		_driver action ["landGear",_UAV];
		_driver setPos [0,0,0];
		selectPlayer _player;		
		
		_i=0;
		while {(_i<5)} do
		{
			[_UAV,_PitchBank select 0,_PitchBank select 1] call Func_System_SetPitchBank;
			_i=_i+0.035;
			sleep 0.01;
		};		
	}
	else
	{
		sleep 5;
	};

	_pos=getPosASL _UAV;
	_para=createVehicle [_para,_pos,[],0,"NONE"];
	_para setPosASL _pos;
	_para setDir (getDir _UAV);

	_UAV setVelocity [0,0,0];
	_UAV attachTo [_para,_attachPos];
	
	_dir=getDir _para;
	_dam=getDammage _UAV;

	while {(alive _para) && (((getPosATL _UAV) select 2)>1.2)} do
	{
		sleep 0.1;
		_para setDir _dir;
		_UAV setDamage _dam;
	};

	detach _UAV;
	_pos=position _UAV;
	_UAV setDir (getDir _UAV);
	_UAV setPos [_pos select 0,_pos select 1,0];
	_UAV setVelocity [0,0,0];
	
	sleep 5;
	
	deleteVehicle _para;
	
	_UAV call Func_UAV_CheckPilot;
}
else
{
	_status=_UAV getVariable "uav_status_active";
	
	if (_status select 0) exitWith {};
	
	if (_UAV call Func_UAV_CheckPilot) then
	{		
		player commandChat localize "STR_UAV_TakingOff";
		
		_UAV setVariable ["uav_status_active",[true,time+50],true];	
		
		_way=(group _UAV) addWaypoint [getPos _UAV,500,1];		
		_way setWaypointBehaviour "careless";
		_way setWaypointCombatMode "blue";
		_way setWaypointType "HOLD";
		_UAV setFuel 1;
		
		(driver _UAV) action ["engineOn",_UAV];
		
		_dam=getDammage _UAV;
		_UAV setDamage 0.5;
		_UAV setDamage _dam;

		_vel=0;
		_maxvel=70;
		_dir=getDir _UAV;

		while {(_vel < _maxvel) && (alive _UAV) && ((_UAV emptyPositions "Driver")==0)} do
		{			
			_UAV setDir _dir;
			_UAV setVelocity [_vel*sin(_dir),_vel*cos(_dir),_vel / 10];		
			_vel=_vel+0.05;
			sleep 0.01;
		};	

		if 	((alive _UAV) && ((_UAV emptyPositions "Driver")==0)) then
		{
			player commandChat localize "STR_UAV_Ready";
		};
	};
};
