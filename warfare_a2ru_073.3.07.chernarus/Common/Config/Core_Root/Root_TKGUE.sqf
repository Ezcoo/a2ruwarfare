Private ["_side"];

_side = "GUER";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'TK_GUE_Soldier_EP1'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'TK_GUE_Soldier_EP1'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'TK_GUE_Soldier_EP1'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\ca\ca_e\data\flag_tkg_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['V3S_TK_GUE_EP1','V3S_Gue']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['WarfareRepairTruck_Gue','V3S_Repair_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_Gue','V3S_Salvage_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_Gue','V3S_Supply_TK_GUE_EP1']];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_TK0_EP1','WFHQ_TK1_EP1','WFHQ_TK2_EP1','WFHQ_TK3_EP1','WFHQ_TK4_EP1']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocol_EP1_TK'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AR_EP1','TK_GUE_Bonesetter_EP1']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_MG_EP1','TK_GUE_Bonesetter_EP1','TK_GUE_Soldier_Sniper_EP1','TK_GUE_Soldier_Sniper_EP1']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_4_EP1','TK_GUE_Soldier_5_EP1','TK_GUE_Soldier_Sniper_EP1','TK_GUE_Soldier_Sniper_EP1']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'UH1H_TK_GUE_EP1'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'V3S_Repair_TK_GUE_EP1'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['V3S_TK_GUE_EP1','Offroad_DSHKM_TK_GUE_EP1']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['TKBasicAmmunitionBox_EP1','TKBasicWeapons_EP1','TKLaunchers_EP1']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'BTR40_TK_GUE_EP1'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'UH1H_TK_GUE_EP1'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumEast_EP1'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'V3S_Supply_TK_GUE_EP1'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["TK_CIV_Worker01_EP1"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['TK_GUE_Soldier_EP1','TK_GUE_Soldier_MG_EP1','TK_GUE_Soldier_Sniper_EP1','TK_GUE_Bonesetter_EP1'], 
		['TK_GUE_Warlord_EP1','TK_GUE_Soldier_AR_EP1','TK_GUE_Soldier_3_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_4_EP1'],
		['Offroad_DSHKM_TK_GUE_EP1','Offroad_SPG9_TK_GUE_EP1']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BTR40_MG_TK_GUE_EP1','Ural_ZU23_TK_GUE_EP1'], 
		['V3S_TK_GUE_EP1','TK_GUE_Warlord_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_MG_EP1','TK_GUE_Soldier_HAT_EP1'],
		['BTR40_MG_TK_GUE_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Bonesetter_EP1']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['T34_TK_GUE_EP1','T34_TK_GUE_EP1'], 
		['T55_TK_GUE_EP1','T55_TK_GUE_EP1'],
		['TK_GUE_Soldier_Sniper_EP1','TK_GUE_Soldier_5_EP1','TK_GUE_Soldier_Sniper_EP1']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_4_EP1','TK_GUE_Soldier_AR_EP1','TK_GUE_Soldier_4_EP1','TK_GUE_Soldier_MG_EP1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_2_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_MG_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Bonesetter_EP1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_3_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AA_EP1','TK_GUE_Soldier_Sniper_EP1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['TK_GUE_Warlord_EP1','TK_GUE_Soldier_EP1','TK_GUE_Soldier_AR_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_AT_EP1','TK_GUE_Soldier_5_EP1']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['AKS_74_kobra','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG18','Makarov']],
		[['AKS_74_U','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_U','RPG18','Makarov']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['AKS_74_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG7V','Makarov']],
		[['AKS_74_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG7V','Makarov']],
		[['SVD','MakarovSD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','HandGrenade_East','HandGrenade_East','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD'],
		 ['SVD','MakarovSD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['AKS_74_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_pso','RPG7V','Makarov']],
		[['AKS_74_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_pso','RPG7V','Makarov']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['AK_74_GL_kobra','RPG7V','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VR','PG7VR','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL_kobra','RPG7V']],
		[['AK_74_GL_kobra','MetisLauncher','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','AT13','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL_kobra','MetisLauncher','Makarov']]
	]];
	
	//--- Reinforcer Module [units, needed sv, spawn chance (higher is better)], ground units.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS", _side], [
		[["TK_GUE_Warlord_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Bonesetter_EP1"], 0, 2],
		[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1"], 10, 1],
		[["TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_5_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1"], 10, 1],
		[["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Bonesetter_EP1"], 20, 1],
		[["Offroad_DSHKM_TK_GUE_EP1","Offroad_SPG9_TK_GUE_EP1","Pickup_PK_TK_GUE_EP1"], 10, 2],
		[["BRDM2_TK_GUE_EP1","BRDM2_TK_GUE_EP1","BRDM2_TK_GUE_EP1"], 10, 2],
		[["Ural_ZU23_TK_GUE_EP1","Ural_ZU23_TK_GUE_EP1"], 20, 1],
		[["TK_GUE_Soldier_TL_EP1","BTR40_MG_TK_GUE_EP1","BTR40_MG_TK_GUE_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1"], 10, 2],
		[["TK_GUE_Soldier_TL_EP1","BRDM2_TK_GUE_EP1","BRDM2_TK_GUE_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1"], 10, 2],
		[["T34_TK_GUE_EP1","T34_TK_GUE_EP1"], 10, 1],
		[["T55_TK_GUE_EP1","T55_TK_GUE_EP1"], 20, 2],
		[["T55_TK_GUE_EP1","T55_TK_GUE_EP1","T55_TK_GUE_EP1","T55_TK_GUE_EP1"], 30, 5]
	]];
	
	//--- Reinforcer Module [[[[head vehicles], transport, [tail vehicles]], [[units group 1],[units group 2],[units group 3]...]], needed sv, spawn chance (higher is better)], ground units convoys.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS_CONVOY", _side], [
		[[
			[["Offroad_DSHKM_TK_GUE_EP1"], "V3S_TK_GUE_EP1", ["Offroad_DSHKM_TK_GUE_EP1"]],
			[
				["TK_GUE_Warlord_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Bonesetter_EP1"],
				["TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_5_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1"]
			]
		], 0, 2],
		[[
			[["BRDM2_TK_GUE_EP1"], "V3S_TK_GUE_EP1", ["BRDM2_TK_GUE_EP1"]],
			[
				["TK_GUE_Warlord_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Bonesetter_EP1"],
				["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Bonesetter_EP1"],
				["TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_5_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1"]
			]
		], 10, 1],
		[[
			[["BRDM2_TK_GUE_EP1"], "V3S_TK_GUE_EP1", ["BTR40_MG_TK_GUE_EP1"]],
			[
				["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Bonesetter_EP1"],
				["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AA_EP1","TK_GUE_Soldier_AA_EP1","TK_GUE_Soldier_AA_EP1"],
				["TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_5_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1"]
			]
		], 10, 2],
		[[
			[["T55_TK_GUE_EP1"], "BTR40_TK_GUE_EP1", ["Ural_ZU23_TK_GUE_EP1"]],
			[
				["TK_GUE_Warlord_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Bonesetter_EP1"],
				["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1"]
			]
		], 20, 1]
	]];
	
	if (WF_A2_CombinedOps) then {
		//--- Reinforcer Module [[boat, units], needed sv, spawn chance (higher is better)], naval units.
		missionNamespace setVariable [Format["REINFORCER_%1_NAVAL_UNITS", _side], [
			[[["Fishing_Boat","Smallboat_1"],["TK_GUE_Warlord_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Bonesetter_EP1"]], 0, 2],
			[["Fishing_Boat",["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Bonesetter_EP1"]], 0, 1],
			[[["Fishing_Boat","Smallboat_2"],["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_AT_EP1"]], 0, 1]
		]];
	};
	
	//--- Reinforcer Module [[chopper(s), units], needed sv, spawn chance (higher is better)], aerial units.
	missionNamespace setVariable [Format["REINFORCER_%1_AIR_UNITS", _side], [
		[[if (WF_A2_CombinedOps) then {["UH1H_TK_GUE_EP1","Mi17_Civilian"]} else {"UH1H_TK_GUE_EP1"},["TK_GUE_Warlord_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Bonesetter_EP1"]], 0, 2],
		[[if (WF_A2_CombinedOps) then {["UH1H_TK_GUE_EP1","Mi17_Civilian"]} else {"UH1H_TK_GUE_EP1"},["TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_HAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_2_EP1","TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Bonesetter_EP1"]], 10, 1],
		[[if (WF_A2_CombinedOps) then {["UH1H_TK_GUE_EP1","Mi17_Civilian"]} else {"UH1H_TK_GUE_EP1"},["TK_GUE_Soldier_4_EP1","TK_GUE_Soldier_5_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1","TK_GUE_Soldier_Sniper_EP1"]], 10, 1],
		[[if (WF_A2_CombinedOps) then {["UH1H_TK_GUE_EP1","Mi17_Civilian"]} else {"UH1H_TK_GUE_EP1"},["TK_GUE_Warlord_EP1","TK_GUE_Soldier_TL_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_AR_EP1","TK_GUE_Soldier_MG_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Bonesetter_EP1"]], 10, 1]
	]];
};


//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'Takistani Guerilla'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_TKGUE.sqf";
	if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_PMC") > 0) then {(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_PMC.sqf"};
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['AKS_74_kobra','Makarov','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch','Moscow_Bombing_File'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
	['AKS_74_kobra','Makarov']
]];

//--- Squads.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_OA_TKGUE.sqf";

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_GUE.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_GUE.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_GUE.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_GUE.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_OA_TKGUE.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_OA_TKGUE.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_OA_TKGUE.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_OA_TKGUE.sqf";
};