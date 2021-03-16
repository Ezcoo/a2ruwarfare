private["_car","_state"];

_car=_this select 0;
_state=_this select 1;

if (local _car) then
{
	if (_car getVariable "ignition_off") then
	{
		if (_state) then
		{
			_car engineOn false;
		};
	};
};