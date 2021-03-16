Private ["_side"];

_side = "EAST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'RU_Soldier_Crew'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'RU_Soldier_Pilot'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'RU_Soldier'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\Ca\Data\flag_rus_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['GAZ_Vodnik_MedEvac','M113Ambul_TK_EP1','Mi17_medevac_RU','M113Ambul_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['KamazRepair','UralRepair_TK_EP1','MtvrRepair','MtvrRepair_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_RU','UralSalvage_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_RU','UralSupply_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'Pchela1T'];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_RU0','WFHQ_RU1','WFHQ_RU2']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocolRU'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['RU_Soldier_SL','RU_Soldier_LAT','RU_Soldier','RU_Soldier2','RU_Soldier_AR','RU_Soldier_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['RU_Soldier_SL','RU_Soldier_AT','RU_Soldier_AT','RU_Soldier_AT','RU_Soldier_AA','RU_Soldier_MG','RU_Soldier_Medic','RU_Soldier_Marksman','RUS_Soldier_Marksman']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['MVD_Soldier_TL','RU_Soldier_HAT','RU_Soldier_HAT','RU_Soldier_HAT','RU_Soldier_HAT','RU_Soldier_HAT','RU_Soldier_AA','RU_Soldier_AA','MVD_Soldier_MG','RUS_Commander','MVD_Soldier_Sniper','RUS_Soldier_Marksman']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'Mi17_Ins'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'KamazRepair'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['GAZ_Vodnik_MedEvac','BTR60_TK_EP1','UAZ_AGS30_RU','UAZ_AGS30_RU','LandRover_MG_TK_EP1','LandRover_MG_TK_EP1']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['RUBasicAmmunitionBox','RUBasicWeaponsBox','RULaunchersBox']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'UAZ_RU'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'Mi17_Ins'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumEast'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'WarfareSupplyTruck_RU'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["Worker3","Worker1"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['RU_Soldier_TL','RU_Soldier_MG','RU_Soldier_Sniper','RU_Soldier_Medic'], 
		['RU_Soldier_TL','RU_Soldier_AR','RU_Soldier_GL','RU_Soldier_LAT','RU_Soldier'],
		['GAZ_Vodnik_HMG','GAZ_Vodnik']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BTR90','BTR90'], 
		['Kamaz','RU_Soldier_TL','RU_Soldier_AT','RU_Soldier_MG','RU_Soldier_LAT'],
		['BMP3','RU_Soldier_AA','RU_Soldier_AA','RU_Soldier_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['T72_RU','BMP3'], 
		['T72_RU','T72_RU'],
		['BMP3','BMP3','RU_Soldier_TL','RU_Soldier_MG','RU_Soldier_Marksman','RU_Soldier_Medic','RU_Soldier_AT','RU_Soldier_HAT','RU_Soldier'],
		['BTR90','RU_Soldier_TL','RU_Soldier_Medic','RU_Soldier_GL','RU_Soldier','RU_Soldier_AR']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['RU_Soldier_SL','RU_Soldier','RU_Soldier','RU_Soldier_AR','RU_Soldier_GL','RU_Soldier_MG']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['RU_Soldier_SL','RU_Soldier','RU_Soldier','RU_Soldier_MG','RU_Soldier_AT','RU_Soldier_Medic']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['RU_Soldier_SL','RU_Soldier','RU_Soldier','RU_Soldier_AT','RU_Soldier_AA','RU_Soldier_Marksman']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['RU_Soldier_SL','RU_Soldier','RU_Soldier_AR','RU_Soldier_HAT','RU_Soldier_AT','RU_Soldier_GL']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['AK_107_kobra','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_kobra','RPG18','Makarov']],
		[['AKS_74_U','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_U','RPG18','Makarov']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['AK_107_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_kobra','RPG7V','Makarov']],
		[['AK_107_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_kobra','RPG7V','Makarov']],
		[['SVD','MakarovSD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','HandGrenade_East','HandGrenade_East','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD'],
		 ['SVD','MakarovSD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['AK_107_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_pso','RPG7V','Makarov']],
		[['AK_107_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_pso','RPG7V','Makarov']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['AK_107_GL_pso','RPG7V','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VR','PG7VR','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_107_GL_pso','RPG7V']],
		[['AK_107_GL_pso','MetisLauncher','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','AT13','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_107_GL_pso','MetisLauncher','Makarov']]
	]];
	
	//--- Reinforcer Module [units, needed sv, spawn chance (higher is better)], ground units.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS", _side], [
		[["RU_Soldier_SL","RU_Soldier_AA","RU_Soldier_SniperH","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_LAT","RU_Soldier","RU_Soldier_Medic","RU_Soldier_HAT"], 0, 2],
		[["RU_Soldier_TL","RU_Soldier_AA","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_SniperH","RU_Soldier_LAT","RU_Soldier_HAT"], 60, 1],
		[["RU_Soldier_Sniper","RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_AA","RU_Soldier_SniperH"], 30, 1],
		[["RUS_Soldier_TL","RU_Soldier_SniperH","RU_Soldier_AA","RUS_Soldier_GL","RUS_Soldier2","RUS_Soldier1","RUS_Soldier3","RU_Soldier_HAT"], 50, 2],
		[["MVD_Soldier_TL","MVD_Soldier_Sniper","MVD_Soldier_Sniper","MVD_Soldier_AT","RU_Soldier_AA","MVD_Soldier_Marksman","MVD_Soldier_MG","RU_Soldier_HAT"], 50, 1],
		[["UAZ_AGS30_RU","UAZ_AGS30_RU","UAZ_AGS30_RU"], 10, 1],
		[["GAZ_Vodnik","GAZ_Vodnik_HMG","GAZ_Vodnik_HMG"], 25, 2],
		[["RU_Soldier_TL","BTR90","RU_Soldier_MG","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_LAT"], 40, 2],
		[["BTR90","BTR90"], 40, 1],
		[["RU_Soldier_SL","BMP3","RU_Soldier_AR","RU_Soldier_LAT","RU_Soldier_Medic","RU_Soldier"], 50, 2],
		[["BMP3","BMP3"], 40, 1],
		[["T72_RU","T72_RU","2S6M_Tunguska"], 50, 1],
		[["T90","BMP3","2S6M_Tunguska"], 80, 2],
		[["T90","T90","2S6M_Tunguska"], 100, 3],
		[["BTR90","T90","T90","T72_RU","2S6M_Tunguska"], 100, 2]
	]];
	
	//--- Reinforcer Module [[[[head vehicles], transport, [tail vehicles]], [[units group 1],[units group 2],[units group 3]...]], needed sv, spawn chance (higher is better)], ground units convoys.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS_CONVOY", _side], [
		[[
			[["GAZ_Vodnik"], "Kamaz", ["GAZ_Vodnik_HMG"]],
			[
				["RU_Soldier_SL","RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_LAT","RU_Soldier","RU_Soldier_Medic","RU_Soldier_GL"],
				["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"]
			]
		], 0, 2],
		[[
			[["GAZ_Vodnik_HMG"], "Kamaz", ["GAZ_Vodnik_HMG"]],
			[
				["RU_Soldier_SL","RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_LAT","RU_Soldier","RU_Soldier_Medic","RU_Soldier_GL"],
				["RUS_Soldier_TL","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_GL","RUS_Soldier2","RUS_Soldier1","RUS_Soldier3","RUS_Soldier3"],
				["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"]
			]
		], 40, 1],
		[[
			[["BMP3"], "BTR90", ["BMP3"]],
			[
				["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"],
				["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_HAT","RU_Soldier_HAT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_GL"],
				["RU_Soldier_TL","RU_Soldier_AA","RU_Soldier_AA","RU_Soldier_AA","RU_Soldier_AA"]
			]
		], 50, 1],
		[[
			[["BTR90"], "Kamaz", ["BTR90"]],
			[
				["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"],
				["MVD_Soldier_TL","MVD_Soldier_Sniper","MVD_Soldier_Sniper","MVD_Soldier_AT","MVD_Soldier_AT","MVD_Soldier_Marksman","MVD_Soldier_MG","MVD_Soldier_GL"],
				["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_HAT","RU_Soldier_HAT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_GL"],
				["RU_Soldier_TL","RU_Soldier_AA","RU_Soldier_AA","RU_Soldier_AA","RU_Soldier_AA"]
			]
		], 60, 2],
		[[
			[["T72_RU"], "BMP3", ["BTR90"]],
			[
				["RU_Soldier_SL","RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_LAT","RU_Soldier","RU_Soldier_Medic","RU_Soldier_GL"],
				["RUS_Soldier_TL","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_GL","RUS_Soldier2","RUS_Soldier1","RUS_Soldier3","RUS_Soldier3"],
				["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"]
			]
		], 80, 1],
		[[
			[["T90"], "BMP3", ["2S6M_Tunguska"]],
			[
				["RU_Soldier_SL","RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_LAT","RU_Soldier","RU_Soldier_Medic","RU_Soldier_GL"],
				["MVD_Soldier_TL","MVD_Soldier_Sniper","MVD_Soldier_Sniper","MVD_Soldier_AT","MVD_Soldier_AT","MVD_Soldier_Marksman","MVD_Soldier_MG","MVD_Soldier_GL"],
				["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"]
			]
		], 100, 1]
	]];
	
	//--- Reinforcer Module [[boat, units], needed sv, spawn chance (higher is better)], naval units.
	missionNamespace setVariable [Format["REINFORCER_%1_NAVAL_UNITS", _side], [
		[["PBX",["RU_Soldier_SL","RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_LAT","RU_Soldier","RU_Soldier_Medic","RU_Soldier_GL"]], 0, 2],
		[["PBX",["MVD_Soldier_TL","MVD_Soldier_Sniper","MVD_Soldier_Sniper","MVD_Soldier_AT","MVD_Soldier_AT","MVD_Soldier_Marksman","MVD_Soldier_MG","MVD_Soldier_GL"]], 50, 1],
		[["PBX",["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"]], 40, 1]
	]];
	
	//--- Reinforcer Module [[chopper(s), units], needed sv, spawn chance (higher is better)], aerial units.
	missionNamespace setVariable [Format["REINFORCER_%1_AIR_UNITS", _side], [
		[["Mi17_rockets_RU",["RU_Soldier_SL","RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AR","RU_Soldier_MG","RU_Soldier_LAT","RU_Soldier","RU_Soldier_Medic","RU_Soldier_GL"]], 0, 2],
		[["Mi17_rockets_RU",["MVD_Soldier_TL","MVD_Soldier_Sniper","MVD_Soldier_Sniper","MVD_Soldier_AT","MVD_Soldier_AT","MVD_Soldier_Marksman","MVD_Soldier_MG","MVD_Soldier_GL"]], 50, 1],
		[["Mi17_rockets_RU",["RUS_Soldier_TL","RUS_Soldier_Marksman","RUS_Soldier_Marksman","RUS_Soldier_GL","RUS_Soldier2","RUS_Soldier1","RUS_Soldier3","RUS_Soldier3"]], 50, 1],
		[["Mi17_rockets_RU",["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL"]], 60, 1],
		[["Mi17_rockets_RU",["RU_Soldier_TL","RU_Soldier_AR","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier_GL","RU_Soldier_HAT","RU_Soldier_HAT","RU_Soldier_Sniper","RU_Soldier_Sniper"]], 80, 1]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'Russians'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_RU.sqf";
	if (WF_A2_CombinedOps) then {
		(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_TKA.sqf";
	};
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['AK_107_kobra','RPG18','Makarov','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch','Moscow_Bombing_File'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
	['AK_107_kobra','Makarov']
]];

//--- Squads.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_RU.sqf";

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_RU.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_RU.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_RU.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_RU.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_RU.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_RU.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_RU.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_RU.sqf";
};