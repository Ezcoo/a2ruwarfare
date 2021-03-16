#include "Config_Subsystems.sqf";

System_ArmoredVehicleCM=[];
System_AntiTankMissileChances=[];

Func_Common_InitCustomVehicle = compile preprocessFile "Addon\Valhalla\Common\Func_Common_InitCustomVehicle.sqf";
Func_Common_SwitchIgnition = compile preprocessFile "Addon\Valhalla\Common\Func_Common_SwitchIgnition.sqf";
Func_System_ClearFlaresAndSmokes = compile preprocessFile "Addon\Valhalla\Common\Func_System_ClearFlaresAndSmokes.sqf";
Func_System_IncomingATMissile = compile preprocessFile "Addon\Valhalla\Common\Func_System_IncomingATMissile.sqf";
Func_System_LaunchSmokes = compile preprocessFile "Addon\Valhalla\Common\Func_System_LaunchSmokes.sqf";
Func_System_SpawnSmoke = compile preprocessFile "Addon\Valhalla\Common\Func_System_SpawnSmoke.sqf";

[] spawn 
{		
	//Interpriting Armored vehicles data to be more convinient
	_i=0;
	{
		System_ArmoredVehicleCM set [_i,_x select 1];
		System_ArmoredVehicleTypes set [_i,_x select 0];
		_i=_i+1;
	} forEach System_ArmoredVehicleTypes;
	//End Armored vehicles data

	
	//Interpriting AT missile types data to be more convinient
	_i=0;
	{
		System_AntiTankMissileChances set [_i,_x select 1];
		System_AntiTankMissileTypes set [_i,_x select 0];
		_i=_i+1;
	} forEach System_AntiTankMissileTypes;
	//End AT missile types data
	
	//Arma vehicle Smoke and Flare launcher systems data
	System_FlareLauncherMagazines=getArray(configFile>>"cfgWeapons">>"CMFlareLauncher">>"Magazines");
	System_SmokeLauncherMagazines=getArray(configFile>>"cfgWeapons">>"SmokeLauncher">>"Magazines");	
	//End data	
};
["INITIALIZATION", "Addon\Valhalla\Common\precompile.sqf: Ready"] Call WFBE_CO_FNC_LogContent;