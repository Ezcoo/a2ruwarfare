switch((_this select 3)select 0)do
{		
	case 3://heal some unit
	{
		true spawn Func_Client_HealSomeUnit;
	};
	case 6://field repair a vehicle
	{
		(_this select 0) call Func_Client_FieldRepairs;
	};
	case 23://heal thyself with medical backpack
	{
		false spawn Func_Client_HealSomeUnit;
	};
	case 25://ignition off
	{
		Local_PlayerVehicle setVariable ["ignition_off",true,true];		
		Local_PlayerVehicle setVariable ["ignite_fuel",fuel Local_PlayerVehicle,true];
		Local_PlayerVehicle setFuel 0;		
	};
	case 26://ignition on
	{
		Local_PlayerVehicle setVariable ["ignition_off",false,true];		
		Local_PlayerVehicle setFuel (Local_PlayerVehicle getVariable "ignite_fuel");
	};	
	case 29://radar guidance switch for aa systems
	{
		Local_RadarGuidanceOn=!Local_RadarGuidanceOn;
		
		if (Local_RadarGuidanceOn) then
		{
			[] spawn Func_System_RadarAiming;
		};
	};
};