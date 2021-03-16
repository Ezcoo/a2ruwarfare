	//create local sensors	

	//when player gets into vehicle, we should update useractions	
	_sensor=createTrigger["EmptyDetector",[0,0]];
	_sensor setTriggerActivation ["ANY", "PRESENT", true];
	_sensor setTriggerStatements["(alive player) && ((vehicle player)!=player)","[true] call Func_Client_UpdateVehicleActions","[false] call Func_Client_UpdateVehicleActions"];
		
	//if player selects a disposable RPG as the current weapon
	//add him an ammo
	//if he deselects - remove that ammo
	_sensor=createTrigger["EmptyDetector",[0,0]];
	_sensor setTriggerActivation ["ANY", "PRESENT", true];
	_sensor setTriggerStatements["(alive player) && (Local_PlayerVehicle==player) && ((currentWeapon player) in System_DisposableRPGTypes)","_magazine=(getArray(configFile>>'cfgWeapons'>>secondaryWeapon player>>'magazines')) select 0; player addMagazine _magazine","_magazine=(getArray(configFile>>'cfgWeapons'>>secondaryWeapon player>>'magazines')) select 0; player removeMagazines _magazine"];	
	
	//HALO jump
	_sensor=createTrigger["EmptyDetector",[0,0]];
	_sensor setTriggerActivation ["ANY", "PRESENT", true];
	_sensor setTriggerStatements["(alive player) && (typeOf(vehicle player) in ['ParachuteEast','ParachuteWest','Parachute_TK_EP1','Parachute_US_EP1'])","(vehicle player) execVM 'Addon\Valhalla\Client\Func_Client_Halo.sqf'",""];		
	
	//check if player aproaches a veicle, handle it to add "Lock", "Unlock" etc. actions
	//land vehicles
	_sensor=createTrigger["EmptyDetector",[0,0]];
	_sensor setTriggerActivation ["ANY", "PRESENT", true];
	_sensor setTriggerStatements["(local player) && (alive player) && (Local_PlayerVehicle==player) && ((player distance nearestObject[player,""LandVehicle""])<10) && (alive nearestObject[player,""LandVehicle""]) && !(isNull nearestObject[player,""LandVehicle""]) && !(nearestObject[player,""LandVehicle""] in Local_UserVehicles)","[""LandVehicle""] call Func_Client_AddLockActions",""];

	//check if player aproaches a veicle, handle it to add "Lock", "Unlock" etc. actions
	//air vehicles
	_sensor=createTrigger["EmptyDetector",[0,0]];
	_sensor setTriggerActivation ["ANY", "PRESENT", true];
	_sensor setTriggerStatements["(local player) && (alive player) && (Local_PlayerVehicle==player) && ((player distance nearestObject[player,""Air""])<10) && (alive nearestObject[player,""Air""]) && !(isNull nearestObject[player,""Air""]) && !(nearestObject[player,""Air""] in Local_UserVehicles)","[""Air""] call Func_Client_AddLockActions",""];
