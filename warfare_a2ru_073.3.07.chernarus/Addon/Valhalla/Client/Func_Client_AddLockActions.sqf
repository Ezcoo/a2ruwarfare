	/**/
	#include "defines.sqf"
	
	//adds actions "Lock", "Unlock", "Field repair", "Push crew" to vehicle
	//see Func_Client_CreateSensors
	_param=_this select 0;

	//script is called by the sensor, which activates when player aproaches any vehicle
	_veh=nearestObject[player,_param];

	//check, if vehicle exsists and if it is not allready handled
	/*UAV module check implemented*/
	if (!(isNull _veh) && !(_veh in Local_UserVehicles) && !((typeOf _veh) in UAV_VehicleTypes)) then
	{
		//remove all dead vehicles not to take place in variable
		{if (!(alive _x) || (isNull _x)) then {Local_UserVehicles=Local_UserVehicles-[_x]} } ForEach Local_UserVehicles;

		//get vehicle name to participate in useractions
		_name=getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "DisplayName");	
	
		//add useractions
		if (!(_veh isKindOf "StaticWeapon")) then
		{			
			_veh addAction ["<t color='#4C4FFF'>"+(format[localize "STR_ACT_FieldRepair",_name])+"</t>","Addon\Valhalla\Client\Script_Client_Actions.sqf",[6],-103,false,true,"", "(Local_PlayerVehicle==player) && (alive _target) && ((side _target) in [Local_PlayerSide,civilian]) && (!(canMove _target) || ((getDammage _target)>0.1) || (((fuel _target)==0) && !(_target getVariable 'ignition_off'))) && !Local_TechnicalService"];			
		};		
		
		//register the vehicle not to handle it again
		Local_UserVehicles=Local_UserVehicles+[_veh];		
	};
	