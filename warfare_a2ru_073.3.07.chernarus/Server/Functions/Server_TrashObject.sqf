/*
	Trash an entity. Groups can only be removed once that all it's units are DELETED!
	 Parameters:
		- Object.
*/

Private ["_delay","_group","_isMan","_object","_town"];

_object = _this;
_town = [_object] Call GetClosestLocation;
if !(isNull _object) then {
	_isMan = if (_object isKindOf "Man") then {true} else {false};
	
	_group = if (_isMan) then {group _object} else {grpNull};
	if !(_isMan) then {_object removeAllEventHandlers "hit"};
	_object removeAllEventHandlers "killed";
	
	//--- Override?.
	
	_delay = if (_isMan) then { missionNamespace getVariable "WFBE_C_UNITS_BODIES_TIMEOUT"}else{missionNamespace getVariable "WFBE_C_UNITS_CLEAN_TIMEOUT"};
	if (_object distance _town < 600) then {_delay = 90};
	if (typeOf _object in ["US_Soldier_AT_EP1","US_Soldier_HAT_EP1","TK_Soldier_HAT_EP1","USMC_Soldier_HAT","USMC_Soldier_AT","RU_Soldier_HAT"]) then {_delay = 2};
	sleep _delay;
	
	["INFORMATION", Format["Server_TrashObject.sqf: Deleting [%1], it has been [%2] seconds.", _object, _delay]] Call WFBE_CO_FNC_LogContent;
	
	deleteVehicle _object;
	
	if (_isMan) then {
		if !(isNull _group) then {
			if (isNil {_group getVariable "wfbe_persistent"}) then {if (count (units _group) <= 0) then {deleteGroup _group}};
		};
	};
};