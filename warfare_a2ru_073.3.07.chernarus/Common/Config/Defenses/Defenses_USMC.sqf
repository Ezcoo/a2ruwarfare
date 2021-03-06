/*
	Defenses Definition, define the available defenses.
*/

Private ["_c","_f","_faction","_k","_n","_o","_side","_t"];

_side = "WEST";
_faction = "USMC";

_c = []; //--- Classname
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Category
_k = []; //--- Kind (Used for town defenses)

//--- Defenses (Statics)
_c = _c + ['USMC_WarfareBMGNest_M240'];
_n = _n + [''];
_o = _o + [300];
_t = _t + ["Defense"];
_k = _k + ["MGNest"];

_c = _c + ['SearchLight'];
_n = _n + [''];
_o = _o + [50];
_t = _t + ["Defense"];
_k = _k + [""];

_c = _c + ['M2HD_mini_TriPod'];
_n = _n + [''];
_o = _o + [150];
_t = _t + ["Defense"];
_k = _k + [""];

_c = _c + ['M2StaticMG'];
_n = _n + [''];
_o = _o + [200];
_t = _t + ["Defense"];
_k = _k + ["MG"];

_c = _c + ['MK19_TriPod'];
_n = _n + [''];
_o = _o + [600];
_t = _t + ["Defense"];
_k = _k + ["GL"];

_c = _c + ['TOW_TriPod'];
_n = _n + [''];
_o = _o + [850];
_t = _t + ["Defense"];
_k = _k + ["AT"];

_c = _c + ['Stinger_Pod'];
_n = _n + [''];
_o = _o + [700];
_t = _t + ["Defense"];
_k = _k + ["AA"];

_c = _c + ['M252'];
_n = _n + [''];
_o = _o + [1100];
_t = _t + ["Defense"];
_k = _k + [""];

_c = _c + ['M119'];
_n = _n + [''];
_o = _o + [1800];
_t = _t + ["Defense"];
_k = _k + ["Artillery"];

//--- Defenses management for towns.
if (isServer) then {[_side, _c, _k] Call Compile preprocessFile "Common\Config\Config_Defenses_Towns.sqf"};

//--- Fortitications and rest.

// [_faction, _c, _n, _o, _t] Call Compile preprocessFile "Common\Config\Config_Defenses.sqf";