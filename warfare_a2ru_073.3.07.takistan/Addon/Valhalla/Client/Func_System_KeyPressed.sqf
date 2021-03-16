	private["_key","_shift","_ctrl","_alt","_denyaction"];
	
	if (!(alive player)) exitWith{};

	_key=_this select 1;
	_shift=_this select 2;
	_ctrl=_this select 3;
	_alt=_this select 4;
	
	_denyaction=false;		
	//hint format["%1",_key];
	switch (true) do
	{	
		case (_key in (actionKeys "ZeroingUp")):
		{
			if (Local_PlayerVehicle==player) then
			{			
				if ((currentMuzzle player) in System_GrenadeLauncherMuzzles) then
				{
					_denyaction=true;
					_max=(count System_BallisticGrenadeAngles)-1;
					if (System_CurrentGPSightLevel < _max) then
					{
						System_CurrentGPSightLevel=System_CurrentGPSightLevel+1;
					};
					hintSilent format[localize "STR_HINT_GPSight",(System_BallisticGrenadeAngles select System_CurrentGPSightLevel) select 0];
				}
				else
				{
					if ((currentWeapon player)==(secondaryWeapon player)) then
					{	
						_denyaction=true;					
						if (System_CurrentATSightLevel < 4) then
						{
							System_CurrentATSightLevel=System_CurrentATSightLevel+1;
						};
						hintSilent format[localize "STR_HINT_ATSight",System_CurrentATSightLevel*100];
					};
				};
			};			
		};
		case (_key in (actionKeys "ZeroingDown")):
		{
			if (Local_PlayerVehicle==player) then
			{	
				if ((currentMuzzle player) in System_GrenadeLauncherMuzzles) then
				{
					_denyaction=true;
					if (System_CurrentGPSightLevel > 0) then
					{
						System_CurrentGPSightLevel=System_CurrentGPSightLevel-1;
					};				
					hintSilent format[localize "STR_HINT_GPSight",(System_BallisticGrenadeAngles select System_CurrentGPSightLevel) select 0];
				}
				else
				{
					if ((currentWeapon player)==(secondaryWeapon player)) then
					{
						_denyaction=true;
						if (System_CurrentATSightLevel > 1) then
						{
							System_CurrentATSightLevel=System_CurrentATSightLevel-1;
						};
						hintSilent format[localize "STR_HINT_ATSight",System_CurrentATSightLevel*100];
					};
				};			
			};
		};
		case (_key in actionKeys "carForward"):
		{		
			Local_KeyPressedForward=true;
		};
		case (_key in actionKeys "carFastForward"):
		{			
			Local_KeyPressedForward=true;
		};
		case (_key in actionKeys "carSlowForward"):
		{			
			Local_KeyPressedForward=true;
		};
		case (_key==19): //"R" button
		{
			if ((Local_PlayerVehicle!=player) && (player ==(commander Local_PlayerVehicle)) && ((typeOf Local_PlayerVehicle) in System_ArmoredVehicleTypes)) then
			{
				[Local_PlayerVehicle,0,true,objNull] call Func_System_LaunchSmokes;
			};
		};		
		default
		{			
		};
	};
	_denyaction	
	
	