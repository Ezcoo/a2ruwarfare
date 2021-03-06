/*
	Triggered whenever the HQ is killed.
	 Parameters:
		- HQ
		- Shooter
*/

Private ["_building","_dammages","_dammages_current","_get","_killer","_logik","_origin","_structure"];

_structure = _this select 0;
_killer = _this select 1;

_structure_kind = typeOf _structure;
_side = _structure getVariable "wfbe_side";
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

//--- If HQ was mobibilized, spawn a dead hq.
if ((_side) Call WFBE_CO_FNC_GetSideHQDeployStatus) then {
	Private ["_hq"];
	_hq = [missionNamespace getVariable Format["WFBE_%1MHQNAME", _side], getPos _structure, (_side) Call WFBE_CO_FNC_GetSideID, getDir _structure, false, false, false] Call WFBE_CO_FNC_CreateVehicle;
	_hq setPos (getPos _structure);
	_hq setVariable ["wfbe_trashable", false];
	_hq setVariable ["wfbe_side", _side];
	_hq setDamage 1;

	//--- HQ is now considered mobilized.
	_logik setVariable ["wfbe_hq_deployed", false, true];
	_logik setVariable ["wfbe_hq",_hq,true];
	
	//--- Remove the structure after the burial.
	(_structure) Spawn {sleep 10; deleteVehicle _this};
};

//--- Spawn a radio message.
[_side, "Destroyed", ["Base", _structure]] Spawn SideMessage;

//--- Teamkill? [_side, "SendMessage", ["command", "tkill", [name _killer, _structure_kind]]] Call WFBE_CO_FNC_SendToClients
_teamkill = if (side _killer == _side) then {true} else {false};

// Prodavec: Reward
// -----------------------------------------------------------------------
//--- Show ID?
_killer_uid = if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_UID_SHOW") == 0) then {"xxxxxxx"} else {getPlayerUID _unit};

if ((!isNull _killer) && (isPlayer _killer)) then
{
    if (_teamkill) then
    {
        [_side, "LocalizeMessage", ["BuildingTeamkill", name _killer, _killer_uid, _structure_kind]] call WFBE_CO_FNC_SendToClients;
    }
    else
    {
        [nil, "LocalizeMessage", ["HeadHunterReceiveBounty", (name _killer), 49500, _structure_kind, _side]] call WFBE_CO_FNC_SendToClients;
    };
}
else
{
    // ERROR: NO VEHICLE / NO UNIT handling
    [nil, "LocalizeMessage", ["BuildingKilledByError", _structure_kind, _side]] call WFBE_CO_FNC_SendToClients;
};
// -----------------------------------------------------------------------

["INFORMATION", Format["Server_OnHQKilled.sqf : [%1] HQ [%2] has been destroyed by [%3], Teamkill? [%4], Side Teamkill? [%5] coord#1 %6  coord#2 %7", _side, _structure_kind, name _killer, _teamkill, side _killer, getpos _structure ,  _hqc ]] Call WFBE_CO_FNC_LogContent;

/*
_msg = format ["Server_OnHQKilled.sqf: _this = %1", _this];
player sideChat _msg;
diag_log _msg;
*/
