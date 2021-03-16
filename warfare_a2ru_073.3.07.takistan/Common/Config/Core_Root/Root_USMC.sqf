Private ["_side"];

_side = "WEST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'USMC_Soldier_Crew'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'USMC_Soldier_Pilot'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'USMC_Soldier'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\Ca\Data\flag_usa_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['HMMWV_Ambulance','HMMWV_Ambulance_DES_EP1','UH60M_MEV_EP1','M1133_MEV_EP1']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['MtvrRepair','MtvrRepair_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_USMC','MtvrSalvage_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_USMC','MtvrSupply_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'MQ9PredatorB'];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_EN0','WFHQ_EN1','WFHQ_EN2']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocolEN'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['USMC_Soldier_SL','USMC_Soldier_LAT','USMC_Soldier','USMC_Soldier2','USMC_Soldier_AR','USMC_Soldier_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['USMC_Soldier_SL','USMC_Soldier_AT','USMC_Soldier_AT','USMC_Soldier_AT','USMC_Soldier_AA','USMC_Soldier_MG','USMC_Soldier_Medic','USMC_SoldierS_Spotter','USMC_SoldierS_Sniper']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['FR_Assault_R','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_AA','USMC_Soldier_AA','FR_AR','FR_AC','USMC_Soldier_Medic','FR_Marksman','USMC_Soldier_AT','USMC_SoldierS_Sniper']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'C130J'];	//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'MtvrRepair'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['HMMWV_Ambulance','LAV25']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['USBasicAmmunitionBox','USBasicWeaponsBox','USLaunchersBox']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'HMMWV'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'MH60S'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumWest'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'WarfareSupplyTruck_USMC'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["Worker2","Worker4"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['USMC_Soldier_TL','USMC_Soldier_MG','USMC_SoldierS_Sniper','USMC_Soldier_Medic'], 
		['USMC_Soldier_TL','USMC_Soldier_AR','USMC_Soldier_GL','USMC_Soldier_LAT','USMC_Soldier'],
		['HMMWV_M2','HMMWV_MK19']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['LAV25','LAV25'], 
		['MTVR','USMC_Soldier_TL','USMC_Soldier_AT','USMC_Soldier_MG','USMC_Soldier_LAT'],
		['AAV','USMC_Soldier_AA','USMC_Soldier_AA','USMC_Soldier_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['M1A1','AAV'], 
		['M1A1','M1A1'],
		['AAV','AAV','USMC_Soldier_TL','USMC_Soldier_MG','USMC_SoldierM_Marksman','USMC_Soldier_Medic','USMC_Soldier_AT','USMC_Soldier_HAT','USMC_Soldier'],
		['LAV25','USMC_Soldier_TL','USMC_Soldier_Medic','USMC_Soldier_GL','USMC_Soldier','USMC_Soldier_AR']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['USMC_Soldier_SL','USMC_Soldier','USMC_Soldier','USMC_Soldier_AR','USMC_Soldier_GL','USMC_Soldier_MG']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['USMC_Soldier_SL','USMC_Soldier','USMC_Soldier','USMC_Soldier_MG','USMC_Soldier_LAT','USMC_Soldier_Medic']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['USMC_Soldier_SL','USMC_Soldier','USMC_Soldier','USMC_Soldier_AT','USMC_Soldier_AA','USMC_SoldierS_Sniper']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['USMC_Soldier_SL','USMC_Soldier','USMC_Soldier_AR','USMC_Soldier_HAT','USMC_Soldier_LAT','USMC_Soldier_GL']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['m16a4_acg','M136','Colt1911','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['m16a4_acg','M136','Colt1911']],
		[['G36C','M136','Colt1911','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36C','M136','Colt1911']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['M4A1_Aim_camo','M136','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['M4A1_Aim_camo','M136','Colt1911']],
		[['G36K','M136','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36K','M136','Colt1911']],
		[['DMR','M9SD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','HandGrenade_West','HandGrenade_West','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD'],
		 ['DMR','M9SD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['M4A1_Aim_camo','SMAW','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','SMAW_HEAA','SMAW_HEAA','SMAW_HEDP','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['M4A1_Aim_camo','SMAW','Colt1911']],
		[['G36C','SMAW','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','SMAW_HEAA','SMAW_HEAA','SMAW_HEDP','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36C','SMAW','Colt1911']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['M4A1_HWS_GL','SMAW','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','SMAW_HEAA','SMAW_HEAA','SMAW_HEDP','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['M4A1_HWS_GL','SMAW']],
		[['M4A1_HWS_GL_camo','Javelin','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['M4A1_HWS_GL_camo','Javelin','Colt1911']]
	]];
	
	//--- Reinforcer Module [units, needed sv, spawn chance (higher is better)], ground units.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS", _side], [
		[["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AR","USMC_Soldier_MG","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_Medic","USMC_Soldier_GL"], 0, 2],
		[["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_LAT","USMC_Soldier_GL"], 60, 1],
		[["USMC_SoldierS_Sniper","USMC_SoldierS_Sniper","USMC_SoldierS_Sniper","USMC_SoldierM_Marksman","USMC_SoldierS_SniperH"], 30, 1],
		[["FR_TL","FR_AR","FR_GL","FR_Marksman","FR_R","FR_Corpsman","FR_AC","FR_AC"], 50, 1],
		[["HMMWV_M2","HMMWV_Mk19","HMMWV_TOW"], 20, 2],
		[["HMMWV_Avenger","HMMWV_Avenger"], 50, 1],
		[["USMC_Soldier_TL","LAV25","USMC_Soldier_MG","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_LAT"], 40, 2],
		[["LAV25","LAV25"], 40, 1],
		[["USMC_Soldier_SL","AAV","USMC_Soldier_AR","USMC_Soldier_LAT","USMC_Soldier_Medic","USMC_Soldier"], 50, 2],
		[["M1A1","M1A1"], 50, 1],
		[["M1A2_TUSK_MG","M1A2_TUSK_MG"], 80, 2],
		[["M1A2_TUSK_MG","M1A2_TUSK_MG","M1A2_TUSK_MG","M1A2_TUSK_MG"], 100, 3]
	]];
	
	//--- Reinforcer Module [[[[head vehicles], transport, [tail vehicles]], [[units group 1],[units group 2],[units group 3]...]], needed sv, spawn chance (higher is better)], ground units convoys.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS_CONVOY", _side], [
		[[
			[["HMMWV_M2"], "MTVR", ["HMMWV_M2"]],
			[
				["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AR","USMC_Soldier_MG","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_Medic","USMC_Soldier_GL"],
				["USMC_Soldier_SL","USMC_Soldier_LAT","USMC_Soldier_LAT","USMC_SoldierS_Sniper","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_Medic","USMC_Soldier_Medic"]
			]
		], 0, 2],
		[[
			[["HMMWV_M2"], "MTVR", ["HMMWV_Mk19"]],
			[
				["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AR","USMC_Soldier_MG","USMC_Soldier_AT","USMC_Soldier","USMC_Soldier_Medic"],
				["FR_TL","FR_AR","FR_GL","FR_Marksman","FR_R","FR_Corpsman","FR_AC","FR_AC"],
				["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_GL"]
			]
		], 40, 1],
		[[
			[["LAV25"], "MTVR", ["LAV25"]],
			[
				["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AR","USMC_Soldier_MG","USMC_Soldier_AT","USMC_Soldier","USMC_Soldier_Medic"],
				["USMC_Soldier_SL","USMC_SoldierS_Spotter","USMC_Soldier_MG","USMC_Soldier_AR","USMC_Soldier_AR","USMC_Soldier_AA","USMC_Soldier_AA","USMC_Soldier_AA"],
				["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_HAT","USMC_Soldier_HAT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_GL"]
			]
		], 60, 2],
		[[
			[["M1A1"], "AAV", ["HMMWV_Avenger"]],
			[
				["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AR","USMC_Soldier_MG","USMC_Soldier_AT","USMC_Soldier","USMC_Soldier_Medic","USMC_Soldier_GL"],
				["FR_TL","FR_AR","FR_GL","FR_Marksman","FR_R","FR_Corpsman","FR_AC","FR_AC"],
				["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT"]
			]
		], 80, 2]
	]];
	
	//--- Reinforcer Module [[boat, units], needed sv, spawn chance (higher is better)], naval units.
	missionNamespace setVariable [Format["REINFORCER_%1_NAVAL_UNITS", _side], [
		[["RHIB",["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AR","USMC_Soldier_MG","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_Medic","USMC_Soldier_GL"]], 0, 2],
		[["RHIB2Turret",["FR_TL","FR_AR","FR_GL","FR_Marksman","FR_R","FR_Corpsman","FR_AC","FR_AC"]], 50, 1],
		[["RHIB2Turret",["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT"]], 40, 1]
	]];
	
	//--- Reinforcer Module [[chopper(s), units], needed sv, spawn chance (higher is better)], aerial units.
	missionNamespace setVariable [Format["REINFORCER_%1_AIR_UNITS", _side], [
		[["MH60S",["USMC_Soldier_SL","USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AR","USMC_Soldier_MG","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_Medic","USMC_Soldier_GL"]], 0, 2],
		[["UH1Y",["FR_TL","FR_AR","FR_GL","FR_Marksman","FR_R","FR_Corpsman","FR_R","FR_Corpsman","FR_AC","FR_AC"]], 50, 1],
		[[["MH60S","UH1Y"],["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AR","USMC_Soldier_MG","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_Medic","USMC_Soldier_GL"]], 60, 1],
		[[["MH60S","UH1Y"],["USMC_Soldier_TL","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AT","USMC_Soldier_AR","USMC_Soldier_MG","USMC_Soldier_LAT","USMC_Soldier","USMC_Soldier_Medic","USMC_Soldier_HAT","USMC_Soldier_AT","USMC_Soldier_AT"]], 80, 1]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'USMC'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_USMC.sqf";
	if (WF_A2_CombinedOps) then {
		(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_US.sqf";
	};
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['M4A1_Aim','M136','M9','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch','Moscow_Bombing_File'],
	['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','HandGrenade_West','HandGrenade_West','HandGrenade_West','SmokeShellBlue','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD'],
	['M4A1_Aim','M9']
]];

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_US.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_US.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_USMC.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_US.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_US.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_USMC.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_USMC.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_USMC.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_USMC.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_USMC.sqf";
};