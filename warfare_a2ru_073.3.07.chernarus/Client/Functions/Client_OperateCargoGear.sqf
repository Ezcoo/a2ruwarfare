/*
	Add or substract items from a cargo gear.
	 Parameters:
		- Items & Count
		- Operation
		- Item
*/

Private ["_array","_index","_item","_itemcount","_operate"];

_array = _this select 0;
_operate = _this select 1;
_item = _this select 2;

//--- Since we have no case insensitive find in the engine and since the config name change like your underwears we use a for-loop...
_index = -1;
for '_i' from 0 to count(_array select 0)-1 do {
	if ((_array select 0) select _i == _item) exitWith {_index = _i};
};

_itemcount = if (_index != -1) then {(_array select 1) select _index} else {-1};

switch (_operate) do {
	case "add": {
		if (_itemcount == -1) then {
			[(_array select 0), _item] Call WFBE_CO_FNC_ArrayPush;
			[(_array select 1), 1] Call WFBE_CO_FNC_ArrayPush;
		} else {
			(_array select 1) set [_index, ((_array select 1) select _index) + 1];
		};
	};
	case "substract": {
		if (_itemcount < 2) then {
			(_array select 0) set [_index, false];
			(_array select 1) set [_index, false];
			_array set [0, (_array select 0) - [false]];
			_array set [1, (_array select 1) - [false]];
		} else {
			if (_index != -1) then {(_array select 1) set [_index, ((_array select 1) select _index) - 1]};
		};
	};
};

_array