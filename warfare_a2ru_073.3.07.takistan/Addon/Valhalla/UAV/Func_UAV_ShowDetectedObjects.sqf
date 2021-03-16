if ((count UAV_DetectedObjects) > 0) then
{
	_i=0;
	_timer=serverTime;
	_clearance=false;
	{	
		if ((typeName _x)!="ARRAY") then
		{
			_name=format["u%1",_x];
			createMarkerLocal [_name,position _x];	
			
			_type="";
            // Prodavec: EastMHQ and WestMHQ is not defined, using WFBE_CO_FNC_GetSideHQ instead
            // ----------------------------------------
            _eastMHQ = east call WFBE_CO_FNC_GetSideHQ;
            _westMHQ = west call WFBE_CO_FNC_GetSideHQ;
            // ----------------------------------------
			switch (true) do
			{
				case ((_x==_eastMHQ) || (_x==_westMHQ)):
				{
					_type="o_hq";					
				};
				case (_x isKindOf "StaticWeapon"):
				{
					_type="o_art";					
				};
				case (_x isKindOf "Man"):
				{
					_type="o_inf";					
				};				
				case (_x isKindOf "Wheeled_APC"):
				{
					_type="n_mech_inf";					
				};
				case (_x isKindOf "Car"):
				{
					_type="n_motor_inf";					
				};
				case (_x isKindOf "Tank"):
				{					
					_type="n_armor";					
				};
				default
				{
					_type="o_empty";					
				};
			};	
			
			_color="ColorGreen";
			switch (side _x) do
			{
				case east:
				{
					_color="ColorRed";
				};
				case west:
				{
					_color="ColorBlue";
				};				
			};			
			
			_name setMarkerTypeLocal _type;			
			_name setMarkerColorLocal _color;
			_name setMarkerSizeLocal [0.80,0.80];
			UAV_DetectedObjects set [_i,[_x,_name]];
		}
		else
		{
			_vehicle=_x select 0;
			_marker=_x select 1;
			if (!(isNull _vehicle)) then
			{
				if (((typeName _vehicle)=="OBJECT") && (alive _vehicle) && ((_vehicle getVariable "uav_track_time")>_timer)) then
				{
					_marker setMarkerPosLocal position _vehicle;				
				}
				else
				{
					deleteMarkerLocal _marker;
					UAV_DetectedObjects set [_i,objNull];
					_clearance=true;
				};
			}
			else
			{
				deleteMarkerLocal _marker;
				UAV_DetectedObjects set [_i,objNull];
				_clearance=true;
			};
		};
		_i=_i+1;
	} forEach UAV_DetectedObjects;
	
	if (_clearance) then
	{
		UAV_DetectedObjects=UAV_DetectedObjects-[objNull];
	};
};