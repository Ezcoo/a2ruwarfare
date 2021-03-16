if (!local player) exitWith{};

#include "Config_Subsystems.sqf";

Local_UserVehicles = [];	
	
Local_PlayerSide=side player;
Local_PlayerVehicle=player;
Local_HighClimbingModeOn=false;
Local_RadarGuidanceOn=false;
Local_TechnicalService=false;

System_RadarTrackedAircraft=objNull;	
	
System_CurrentGPSightLevel=2;
System_CurrentATSightLevel=2;
System_BallisticMissileAngles=[];
System_HaveAARadarVehicleDatas=[];
System_HaveAARadarVehicleRanges=[];

Func_Client_AddLockActions = compile preprocessFile "Addon\Valhalla\Client\Func_Client_AddLockActions.sqf";
Func_Client_CreateSensors = compile preprocessFile "Addon\Valhalla\Client\Func_Client_CreateSensors.sqf";
Func_Client_FieldRepairs = compile preprocessFile "Addon\Valhalla\Client\Func_Client_FieldRepairs.sqf";
Func_Client_HealSomeUnit = compile preprocessFile "Addon\Valhalla\Client\Func_Client_HealSomeUnit.sqf";
Func_Client_ShowCustomMessage = compile preprocessFile "Addon\Valhalla\Client\Func_Client_ShowCustomMessage.sqf";
Func_Client_UpdateOSD = compile preprocessFile "Addon\Valhalla\Client\Func_Client_UpdateOSD.sqf";
Func_Client_UpdateUserActions = compile preprocessFile "Addon\Valhalla\Client\Func_Client_UpdateUserActions.sqf";
Func_Client_UpdateVehicleActions = compile preprocessFile "Addon\Valhalla\Client\Func_Client_UpdateVehicleActions.sqf";
Func_System_AdjustCannonGuidance = compile preprocessFile "Addon\Valhalla\Client\Func_System_AdjustCannonGuidance.sqf";
Func_System_AdjustGrenadeBallistics = compile preprocessFile "Addon\Valhalla\Client\Func_System_AdjustGrenadeBallistics.sqf";
Func_System_AdjustMissileBallistics = compile preprocessFile "Addon\Valhalla\Client\Func_System_AdjustMissileBallistics.sqf";
Func_System_Fired = compile preprocessFile "Addon\Valhalla\Client\Func_System_Fired.sqf";
Func_System_GetFireMode = compile preprocessFile "Addon\Valhalla\Client\Func_System_GetFireMode.sqf";
Func_System_GetPitchBank = compile preprocessFile "Addon\Valhalla\Client\Func_System_GetPitchBank.sqf";
Func_System_KeyPressed = compile preprocessFile "Addon\Valhalla\Client\Func_System_KeyPressed.sqf";
Func_System_RadarAiming = compile preprocessFile "Addon\Valhalla\Client\Func_System_RadarAiming.sqf";
Func_System_SetPitchBank = compile preprocessFile "Addon\Valhalla\Client\Func_System_SetPitchBank.sqf";
	
"Public_TankAttacked" addPublicVariableEventHandler {private["_veh","_cnt"]; _veh=_this select 1; if ((player in _veh)) then {[localize "STR_HINT_Warning",localize "STR_HINT_IncomingATGM","Addon\Valhalla\Pic\ui_notfreeze_ca.01.paa",1.0] call Func_Client_ShowCustomMessage;Public_TankAttacked=objNull;_veh vehicleRadio "tank_alarm"}};		
"Public_VehicleSmokeShells" addPublicVariableEventHandler {{[_x] spawn Func_System_SpawnSmoke} forEach (_this select 1)};

[] spawn 
{	
	waitUntil{(!isNull (findDisplay 46))};
	
	[] call Func_Client_UpdateUserActions;
	[] call Func_Client_CreateSensors;

    // Prodavec: Function not exist
	//[] spawn Func_Client_LimitExternalView;
	
	(findDisplay 46) displayAddEventHandler ["KeyDown","_this call Func_System_KeyPressed"];
	(findDisplay 46) displayAddEventHandler ["KeyUp","Local_KeyPressedForward=false;"];
	player addEventHandler ["fired","_this call Func_System_Fired"];	
	
	//Interpriting missile ballistics data to be more convinient
	_i=0;
	{
		System_BallisticMissileAngles set [_i,[_x select 1,_x select 2,_x select 3,_x select 4,_x select 5]];
		System_BallisticMissileTypes set [_i,_x select 0];
		_i=_i+1;
	} forEach System_BallisticMissileTypes;
	//End missile ballistics data	
	
	//Interpriting vehicle types with AA radar data to be more convinient
	_i=0;
	_j=0;
	{
		System_HaveAARadarVehicleRanges set [_i,_x select 2];		
		{
			System_HaveAARadarVehicleDatas set [_j,_x];
			_j=_j+1;
		} forEach (_x select 1);			
		System_HaveAARadarVehicleTypes set [_i,_x select 0];
		_i=_i+1;
	} forEach System_HaveAARadarVehicleTypes;
	//End vehicle types with AA radar data to be more convinient
};
["INITIALIZATION", "Addon\Valhalla\client\precompile.sqf: Ready"] Call WFBE_CO_FNC_LogContent;