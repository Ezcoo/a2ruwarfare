/*UAV transport script*/
_UAV=_this select 0;
_param=_this select 1;//TRUE - attach, FALSE - detach

if (isNull _UAV) exitWith {};

//some aux functions
_attached=
{
	//the uav was successfully attached to a terminal
	
	//set necessary flags
	_this setVariable ["uav_attached_to",Local_PlayerVehicle,true];//terminal which attached the uav
	Local_PlayerVehicle setVariable ["uav_attached",_this,true];//uav that is attached to the terminal
	
	//show message
	_name=gettext(configFile >> "CfgVehicles" >> typeOf _this >> "displayName");
	[_name,localize "STR_UAV_Picked","Addon\Valhalla\pic\cargopick_ca.paa",1.0] call Func_Client_ShowCustomMessage;
};

_detached=
{
	//the uav was successfully connected to a terminal
	
	//set necessary flags	
	_this setVariable ["uav_attached_to",objNull,true];//terminal which is connected to the uav
	Local_PlayerVehicle setVariable ["uav_attached",objNull,true];//uav that is connected to the terminal
	
	//show message
	_name=gettext(configFile >> "CfgVehicles" >> typeOf _this >> "displayName");
	[_name,localize "STR_UAV_Droped","Addon\Valhalla\pic\cargodrop_ca.paa",1.0] call Func_Client_ShowCustomMessage;
};

//
if (_param) then
{
	//attach the UAV
	
	//find uav data
	_index=UAV_VehicleTypes find (typeOf _UAV);
	_uav_data=UAV_VehicleDatas select _index;
	
	//find terminal data
	_index=UAV_TerminalTypes find (typeOf Local_PlayerVehicle);
	_terminal_data=UAV_TerminalDatas select _index;

	_type=typeOf _UAV;
	{
		if (_type==(_x select 0)) exitWith
		{
			_pos=_x select 1;
			
			//check if terminal can transport such kind of uav`s on the roof
			if ((count _pos) > 0) then
			{										
				//just attach and show message
				_UAV attachTo [Local_PlayerVehicle,_pos];
				_UAV call _attached;
			}
			else
			{	
				//if terminal can't transport the uav on the roof - it is a trouble
				//if it is possible to tow uav by terminal
				if ((count (_uav_data select 7)) > 0) then				
				{					
					//we need the uav to be local for towing - so we have to call Func_UAV_CheckPilot
					if (_UAV call Func_UAV_CheckPilot) then
					{			
						//start towing thread
						[Local_PlayerVehicle,_UAV,UAV_TerminalAxis select _index,(_uav_data select 7) select 1,(_uav_data select 7) select 0] spawn Func_UAV_Towing;						
						_UAV call _attached;
						//planes allways try to take off
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
				};			
			};		
		};
	} forEach _terminal_data;
}
else
{
	//detach a terminal
	
	//find uav data
	_index=UAV_TerminalTypes find (typeOf Local_PlayerVehicle);
	_terminal_data=UAV_TerminalDatas select _index;
		
	_type=typeOf _UAV;
	{		
		//if uav is attached - detach it
		if (_type==(_x select 0)) exitWith
		{
			_pos=_x select 1;				
			if ((count _pos) > 0) then
			{										
				_pos=getPos Local_PlayerVehicle;
				_dir=getDir Local_PlayerVehicle;
				
				_pos=[(_pos select 0)+7*sin(_dir),(_pos select 1)+7*cos(_dir),0];
				
				detach _UAV;
				_UAV setPos _pos;
				_UAV setVelocity [0,0,0];					
			};	
			//if it is towed - _detached will reset flags and towing will stop
			_UAV call _detached;	
		};
	} forEach _terminal_data;
};