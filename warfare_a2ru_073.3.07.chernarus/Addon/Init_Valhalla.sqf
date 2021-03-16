// Prodavec: proper init order required!
call compile preprocessFileLineNumbers "Addon\Valhalla\Common\precompile.sqf";
call compile preprocessFileLineNumbers "Addon\Valhalla\Client\precompile.sqf";
call compile preprocessFileLineNumbers "Addon\Valhalla\UAV\precompile.sqf";
["INITIALIZATION", "Init_Valhalla.sqf.sqf: Ready"] Call WFBE_CO_FNC_LogContent;