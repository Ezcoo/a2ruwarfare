/*Function is used to create pilots both for local and remote UAV's*/
_type=_this select 0;
_side=_this select 1;
_UAV=_this select 2;
_player=_this select 3;

//init variables - mostly for remote using
_group=grpNull;
_driver=_UAV getVariable "uav_driver";

//if the drived allready exists but it is not local to the UAV`s PC
//remove it and make a new one which will be local
if (!(isNull _driver) && (alive _driver)  && !(local _driver)) then
{
	_driver setDamage 1;
};

//if there is no driver or he is unconscious
if (!(isNull _driver) && !(alive _driver)) then
{
	_group=group _driver;
	_driver setPos [0,0,0];
	_driver setVehicleInit "";
	processInitCommands;
	
	deleteVehicle _driver;
	deleteGroup _group;
};

//create a new AI-unit
if ((isNull _driver) || !(alive _driver)) then
{
	_group=createGroup _side;

	_driver=_group createUnit [_type,getPos _UAV,[],5,"NONE"];
	_driver setCombatMode "blue";
	_driver setBehaviour "careless";
	_driver setVehicleInit "this allowDamage false";
	processInitCommands;
	
	_driver setVariable ["dao_wf_side",civilian,true];

	_UAV setVariable ["uav_driver",_driver,true];	
};

//check if the driver is not inside the UAV yet
if ((_UAV emptyPositions "Driver")>0) then
{
	_driver moveInDriver _UAV;
};

//if this function was executed remotely,
//and the driver is inside the uav,
//change the UAV and driver locality - see Func_UAV_CheckPilot
if ((!local _player) && ((_UAV emptyPositions "Driver")==0)) then
{
	_group=group _driver;
	[_driver] joinSilent _player;	
	deleteGroup _group;
};