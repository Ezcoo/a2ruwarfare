#include "defines.sqf"
#include "Config_UAV.sqf"

Config_UAVDetectionTime=30;
	
UAV_TiMode=0;
UAV_CameraActive=false;//var for another VH systems, shownig uav camera is active
UAV_KeyPressed=false;//var for "space" button block when uav camera is active
UAV_MapActive=false;//var indicating wether map is active in uav dialog

UAV_DetectedObjects=[];//objects that have to be marked on the map
UAV_VehicleDatas=[];//working data: uav vehicles
UAV_TerminalDatas=[];//working data: uav terminals
UAV_TerminalAxis=[];//working data: uav vehicles
UAV_LastSpottedMessageTime=0;//timer to show message about detected objects

Func_UAV_ActionManager=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_ActionManager.sqf";
Func_UAV_CheckPilot=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_CheckPilot.sqf";
Func_UAV_CreatePilot=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_CreatePilot.sqf";
Func_UAV_Connection=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_Connection.sqf";
Func_UAV_DeletePilot=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_DeletePilot.sqf";
Func_UAV_HandleDialog=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_HandleDialog.sqf";
Func_UAV_HilightTargets=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_HilightTargets.sqf";
Func_UAV_InitDrone=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_InitDrone.sqf";
Func_UAV_InitTerminal=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_InitTerminal.sqf";
Func_UAV_KeyPress=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_KeyPress.sqf";
Func_UAV_LandHeli=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_LandHeli.sqf";
Func_UAV_LandPlane=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_LandPlane.sqf";
Func_UAV_RepairDrone=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_RepairDrone.sqf";
Func_UAV_ShowDetectedObjects=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_ShowDetectedObjects.sqf";
Func_UAV_Towing=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_Towing.sqf";
Func_UAV_Transport=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_Transport.sqf";
Func_UAV_UpdateVehicleActions=compile preprocessFile "Addon\Valhalla\UAV\Func_UAV_UpdateVehicleActions.sqf";

[] spawn 
{	
	"Public_UAVDetectedObject" addPublicVariableEventHandler {private["_target","_unit"];_target=(_this select 1) select 0;_unit=(_this select 1) select 1;if (local player) then {if ((side _unit)==Local_PlayerSide) then {UAV_DetectedObjects set [count UAV_DetectedObjects,_target];if (UAV_LastSpottedMessageTime < time) then {_unit commandChat format[localize "STR_UAV_Radio",mapGridPosition _target]; UAV_LastSpottedMessageTime=time+12;};};};};
	"Public_UAVCreateNewDriver" addPublicVariableEventHandler {if (local ((_this select 1) select 2)) then {(_this select 1) call Func_UAV_CreatePilot}};
	
	_i=0;
	{
		UAV_VehicleDatas set [_i,_x select 1];
		UAV_VehicleTypes set [_i,_x select 0];		
		_i=_i+1;
	} forEach UAV_VehicleTypes;

	_i=0;
	{
		UAV_TerminalAxis set [_i,_x select 2];
		UAV_TerminalDatas set [_i,_x select 1];		
		UAV_TerminalTypes set [_i,_x select 0];		
		_i=_i+1;
	} forEach UAV_TerminalTypes;

	//checking for spotted vehicles to mark them on map
	_timer=serverTime;
	{
		#ifdef __ARMA2__
		_var=_x getVariable "uav_track_time";
		if (format["%1",_var]=="<null>") then
		{
			_var=0;
		};
		if (_var > _timer) then
		#else
		if ((_x getVariable ["uav_track_time",0])>_timer) then
		#endif
		{
			UAV_DetectedObjects=UAV_DetectedObjects+[_x];
		};			
	} forEach vehicles;
};
["INITIALIZATION", "Addon\Valhalla\UAV\precompile.sqf: Ready"] Call WFBE_CO_FNC_LogContent;