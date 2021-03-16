/*Script checks UAV locality and handles UAV pilot*/
/*very important script for MP*/

_driver=_this getVariable "uav_driver";

_return=false;

//function - delete existing driver
_deletedriver=
{
	private["_group"];

	_group=group _this;
	_this setPos [0,0,0];
	_this setVehicleInit "";
	processInitCommands;
	
	deleteVehicle _this;
	deleteGroup _group;
};

//function - determine necessary pilot type
_drivertype=
{
	private["_driver"];
	_driver="InvisibleManW_EP1";
	if (Local_PlayerSide==east) then {_driver="InvisibleManE_EP1"};
	//_driver="USMC_Soldier";
	//if (Local_PlayerSide==east) then {_driver="RU_Soldier"};
	
	_driver
};

//if there is no driver, or driver is dead, or the uav is not local, or driver is out of uav
if ((isNull _driver) || !(alive _driver) || !(local _this) || ((_this emptyPositions "Driver")>0)) then
{	
	if (local _this) then
	{
		//if the uav is local - everything is pretty easy :)
		
		//if driver is out of uav - in case of !canMove
		if (!(isNull _driver) && (alive _driver)) then
		{
			_driver moveInDriver _this;
		}
		else
		{
			_driver=[] call _drivertype;
			[_driver,Local_PlayerSide,_this,player] call Func_UAV_CreatePilot;
		};
	}
	else
	{
		//we should operate only canMove vehicles, because AI can leave chopper 
		//if it can not move and we can get script not working
		if (canMove _this) then
		{
			//the uav is not not local - we shall have to make some tricks
			//we can't just create an AI and move it into driver's seat
			//moveInDriver requires the UAV to be local - but we don't have it so
			
			_driver=[] call _drivertype;
			
			//send command to remote clients
			//function on some of the remote PC`s will check
			//if the UAV is local there. Will create an AI pilot, move it to driver's seat
			//after, it will joinSilent the pilot to player's group and then join it to grpNull
			//so we will have the local UAV on our client
			//PS: see Func_UAV_CreatePilot, UAV\precompile.sqf, server\precompile.sqf
			Public_UAVCreateNewDriver=[_driver,Local_PlayerSide,_this,player];
			publicVariable "Public_UAVCreateNewDriver";
			
			//we should check if everything is ok and the uav has really became local
			_timer=time+10;
			while {(!(local _this) && (_timer > time))} do
			{
				sleep 0.1;			
			};		
			//unassign the uav driver from player's group, if he is there
			_driver=_this getVariable "uav_driver";
			if ((group _driver)==(group player)) then
			{
				[_driver] joinSilent grpNull;
			};	
		};
	};
};

//if the UAV is local - return true
if (local _this) then
{
	_return=true;
};

_return

