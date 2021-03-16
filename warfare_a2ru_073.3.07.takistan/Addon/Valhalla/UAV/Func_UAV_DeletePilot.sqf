/*deletes the UAV pilot when UAV is deactivated*/
/*or if UAV or controlling terminal suddenly dies*/

_driver=_this getVariable "uav_driver";

if (!isNull _driver) then
{
	//delete pilot and his group
	_group=group _driver;
	_driver setPos [0,0,0];
	_driver setVehicleInit "";
	processInitCommands;
	
	deleteVehicle _driver;
	deleteGroup _group;
	
	//delete laser designator
	_designator=_this getVariable "uav_laser_target";
	if (!isNull _designator) then 
	{
		deleteVehicle _designator;
	};
	
	//set uav flags
	_this setVariable ["uav_status_active",[false,0],true];//participates takeOff / landing functions
	_this setVariable ["uav_driver",objNull,false];//remembers uav ai-driver to delete it when necessary
	_this setVariable ["uav_laser_active",false,true];//if the laser designator is active
};