Private ['_camps','_marker','_town','_townDubbingName','_townMaxSV','_townName','_townRange','_townStartSV','_townValue','_town_type'];

_town = _this select 0;
_townName = _this select 1;
_townDubbingName = _this select 2;
_townStartSV = _this select 3;
_townMaxSV = _this select 4;
_townValue = _this select 5;
_town_type = _this select 6;
_townRange = if (count _this > 7) then {_this select 7} else {550};

waitUntil { !isNil "townModeSet" };
waitUntil { !isNil "WFBE_Parameters_Ready" };
waitUntil {townModeSet && WFBE_Parameters_Ready};

//todo, opposite system.
if ((str _town) in TownTemplate) exitWith {
	["INITIALIZATION",Format ["Init_Town.sqf : Removed town [%1] since it is disabled.", _townName]] Call WFBE_CO_FNC_LogContent;
	_town setVariable ["wfbe_inactive", true];
};

if (isNull _town || (_town getVariable "wfbe_inactive")) exitWith {};

_town setVariable ["name",_townName];
_town setVariable ["range",_townRange];
_town setVariable ["startingSupplyValue",_townStartSV];
_town setVariable ["maxSupplyValue",_townMaxSV];

//--- If the town type is an array rather than a single value, pick a random template (see Server_GetTownGroupsDefender.sqf).
if (typeName _town_type == "ARRAY") then {_town_type = _town_type select floor(random count _town_type)};
_town setVariable ["wfbe_town_type", _town_type];

// Prodavec
waitUntil {(!isNil "commonInitComplete") && {commonInitComplete}};

if (isHostedServer || isDedicated) then {
	Private ["_camps", "_defenses", "_mortars", "_synced"];
	//--- Get the camps and defenses, note that synchronizedObjects only work for the server.
	_camps = [];
	_defenses = [];
	_mortars = [];
	_docks = [];
	for '_i' from 0 to count(synchronizedObjects _town)-1 do {
		_synced = (synchronizedObjects _town) select _i;
		if (typeOf _synced == "LocationLogicCamp" && (missionNamespace getVariable "WFBE_C_CAMPS_CREATE") > 0) then {
			[_camps, _synced] Call WFBE_CO_FNC_ArrayPush;
			_synced setVariable ["town", _town];
		};
		if (!isNil {_synced getVariable "wfbe_defense_kind"}) then {[_defenses, _synced] Call WFBE_CO_FNC_ArrayPush};
		if (!isNil {_synced getVariable "wfbe_mortar"}) then {[_mortars, _synced] Call WFBE_CO_FNC_ArrayPush};
		if (!isNil {_synced getVariable "wfbe_dock"}) then {[_docks, _synced] Call WFBE_CO_FNC_ArrayPush};
	};
	
	["INITIALIZATION",Format ["Init_Town.sqf : Found [%1] synchronized camps in [%2].", count _camps, _town getVariable "name"]] Call WFBE_CO_FNC_LogContent;

	if (count _mortars > 0) then {
		_town setVariable ["wfbe_town_mortars", _mortars];
		["INITIALIZATION",Format ["Init_Town.sqf : Found [%1] synchronized mortar position in [%2].", count _mortars, _town getVariable "name"]] Call WFBE_CO_FNC_LogContent;
	};
	
	if (count _docks > 0) then {_town setVariable ["wfbe_docks", _docks]};
	
	_town setVariable ["camps", _camps, true];
	_town setVariable ["wfbe_town_defenses", _defenses];
	
	_townDubbingName = switch (_townDubbingName) do {
		case "+": {_townName};//--- Copy the name.
		case "": {"Town"};//--- Unknown name, apply Town dubbing.
		default {_townDubbingName};//--- Input name.
	};
	_town setVariable ["wfbe_town_dubbing", _townDubbingName];
	
	//--- Conquest mode variables.
	if ((missionNamespace getVariable "WFBE_C_TOWNS_CONQUEST_MODE") == 1) then {
		{_town setVariable [Format["wfbe_town_capturable_%1", _x], false]} forEach WFBE_PRESENTSIDES;
	};
	
	//--- Don't pause.
	[_town,_townStartSV,_townRange] Spawn {
		Private ["_camps","_defenses","_marker","_size","_town","_townModel","_townRange","_townStartSV"];
		_town = _this select 0;
		_townStartSV = _this select 1;
		_townRange = _this select 2;
		_camps = _town getVariable "camps";

		//--- Models creation.
		_townModel = createVehicle [missionNamespace getVariable "WFBE_C_DEPOT", getPos _town, [], 0, "NONE"];
		_townModel setDir ((getDir _town) + (missionNamespace getVariable "WFBE_C_DEPOT_RDIR"));
		_townModel setPos (getPos _town);
		_townModel addEventHandler ["handleDamage", {false}];
		
		if (isNil {_town getVariable "sideID"}) then {_town setVariable ["sideID",WFBE_DEFENDER_ID,true]};
		_town setVariable ["supplyValue",_townStartSV,true];
		
		sleep (random 1);
		
		waitUntil {serverInitComplete};
		
		{
			Private ["_camp_health","_flag","_pos","_townModel"];
			//--- Create the camp model.
			_townModel = createVehicle [missionNamespace getVariable "WFBE_C_CAMP", getPos _x, [], 0, "NONE"];
			_townModel setDir ((getDir _x) + (missionNamespace getVariable "WFBE_C_CAMP_RDIR"));
			_townModel setPos (getPos _x);
			_townModel addEventHandler ["killed", {(_this select 0) Spawn WFBE_SE_FNC_OnBuildingKilled}];
			
			//--- Maybe we want to make the camp stronger.
			_camp_health = missionNamespace getVariable "WFBE_C_CAMP_HEALTH_COEF";
			if !(isNil '_camp_health') then {
				_townModel addEventHandler ["handleDamage",{getDammage (_this select 0)+((_this select 2)/(missionNamespace getVariable "WFBE_C_CAMP_HEALTH_COEF"))}];
			};
			
			//--- Create a flag near the camp location & position it.
			_flag = createVehicle [missionNamespace getVariable "WFBE_C_CAMP_FLAG", getPos _x, [], 0, "NONE"];
			_pos = _x modelToWorld (missionNamespace getVariable "WFBE_C_CAMP_FLAG_POS");
			_pos set [2, 0];
			_flag setPos _pos;
			
			_x setVariable ["wfbe_flag", _flag];
			
			//--- Initialize the camp.
			if (isNil {_x getVariable "sideID"}) then {_x setVariable ["sideID",WFBE_DEFENDER_ID,true]};
			if (isNil {_x getVariable "supplyValue"}) then {
				waitUntil {!isNil {_town getVariable "supplyValue"}};
				_x setVariable ["supplyValue", _town getVariable "supplyValue", true];
				_x setVariable ["wfbe_camp_bunker", _townModel, true];
				[_x, _town, _flag] Spawn {sleep random 2; _this execFSM 'Server\FSM\server_town_camp.fsm'};
			};
			["INITIALIZATION",Format ["Init_Town.sqf : Initialized Camp in [%1].", _town getVariable "name"]] Call WFBE_CO_FNC_LogContent;
		} forEach _camps;
		
        // Prodavec
        waitUntil {!isNil "townInitServer" && {townInitServer}};
		
		//--- Prepare the default defenses (if needed and if occupation or defender is present).
		if ((_town getVariable "sideID") != WFBE_C_UNKNOWN_ID && ((missionNamespace getVariable "WFBE_C_TOWNS_DEFENDER") > 0 || (missionNamespace getVariable "WFBE_C_TOWNS_OCCUPATION") > 0)) then {
			[_town, (_town getVariable "sideID") Call WFBE_CO_FNC_GetSideFromID, -1] Call WFBE_SE_FNC_ManageTownDefenses;
		};

		//--- Town SV & Control script.
		[_town, _townRange] Spawn {sleep random 2; _this execFSM 'Server\FSM\server_town.fsm'};

		//--- Main Town AI Script
		if ((missionNamespace getVariable "WFBE_C_TOWNS_DEFENDER") > 0 || (missionNamespace getVariable "WFBE_C_TOWNS_OCCUPATION") > 0) then {[_town, _townRange] Spawn { sleep random 2; _this execFSM 'Server\FSM\server_town_ai.fsm'}};
	};
};

//--- Client camp init.
if (isHostedServer || (!isHeadLessClient && !isDedicated)) then {
	waitUntil {!isNil {_town getVariable "camps"}};
	
	_camps = _town getVariable "camps";
	for '_i' from 0 to count(_camps)-1 do {
		_camp = _camps select _i;
		_camp setVariable ["wfbe_camp_marker", Format ["WFBE_%1_CityMarker_Camp%2", str _town, _i]];
		_camp setVariable ["town", _town];
	};
	
	["INITIALIZATION",Format ["Init_Town.sqf : (Client) Initialized Camps [%1] for town [%2].", count _camps, _townName]] Call WFBE_CO_FNC_LogContent;
};

//--- UPSMON Area Definition.
if ((missionNamespace getVariable "WFBE_C_MODULE_UPSMON") > 0) then {
	_marker = Format['UPSMON_TOWN_%1',str _town];
	createMarkerLocal [_marker, getPos _town];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerShapeLocal "RECTANGLE";
	_marker setMarkerBrushLocal "BORDER";
	_size = missionNamespace getVariable "WFBE_C_MODULES_UPSMON_TOWN_AREA";
	_marker setMarkerSizeLocal [_size select 0,_size select 1];
	_marker setMarkerAlphaLocal 0;
};

["INITIALIZATION",Format ["Init_Town.sqf : Initialized town [%1].", _townName]] Call WFBE_CO_FNC_LogContent;

towns = towns + [_town];