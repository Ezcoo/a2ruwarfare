/*UAV drone init script*/

_UAV=_this select 0;

//flags
_UAV setVariable ["uav_status_active",[false,0],true];//flag for takeOff/landing
_UAV setVariable ["uav_driver",objNull,true];//current uav driver
_UAV setVariable ["uav_attached_to",objNull,true];//terminal that is transporting the uav at the moment
_UAV setVariable ["uav_activated_by",objNull,true];//terminal connected to the uav at the moment
_UAV setVariable ["uav_repair",0,true];//uav last repair time
_UAV setVariable ["uav_laser_active",false,true];//if the laser designator is active
_UAV setVariable ["uav_laser_target",objNull,true];//the laser target itself

{_UAV removeWeapon _x} forEach (weapons _UAV);
{_UAV removeMagazine _x} forEach (magazines _UAV);