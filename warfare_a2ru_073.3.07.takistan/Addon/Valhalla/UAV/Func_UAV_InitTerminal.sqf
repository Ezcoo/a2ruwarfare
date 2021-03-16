/*UAV terminal init script*/
_terminal=_this select 0;

//flags
_terminal setVariable ["uav_active",objNull,true];//uav is currently connected
_terminal setVariable ["uav_attached",objNull,true];//uav is currently attached