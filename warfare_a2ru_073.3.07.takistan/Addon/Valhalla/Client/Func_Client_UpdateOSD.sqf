	disableSerialization;
	
	_display=uiNamespace getVariable "AARadarGUI";
	
	_showcontrol=
	{
		private["_control","_name","_pos"];
		
		_control=_this select 0;
		_name=_this select 1;
		_pos=_this select 2;
			
		_control ctrlSetStructuredText _name;
		_control ctrlSetPosition [(_pos select 0)-0.125,_pos select 1];
		_control ctrlCommit 0;
		waitUntil {ctrlCommitted _control};
	};
		
	_hidecontrol=
	{
		_control ctrlSetStructuredText parseText "";			
	};
	
	_TimerC=0;
	
	_hasLaserScanner=false;
	_hasAARadar=false;
	
	_radarTargetShown=false;
	_laserTargetsShown=false;
	
	_lasers=[];
	_targets=if (Local_PlayerSide==east) then {["LaserTargetE","NVG_TargetE","NVG_TargetC"]} else {["LaserTargetW","NVG_TargetW"]};
	
	while {(Local_PlayerVehicle!=player) && (alive player)} do
	{	
		_timer=time;
		if (_TimerC<_timer) then
		{
			_TimerC=_timer+2;
			if ((player==gunner Local_PlayerVehicle) && (cameraView=="GUNNER") && (({Local_PlayerVehicle isKindOf _x} count System_HaveAARadarVehicleTypes)>0) && ((currentWeapon Local_PlayerVehicle) in System_HaveAARadarVehicleDatas)) then
			{
				_hasAARadar=true;			
			}
			else
			{
				_hasAARadar=false;
			};
			
			if ((({Local_PlayerVehicle isKindOf _x} count System_HaveDesignatorVehicleTypes)>0) && ((player==driver Local_PlayerVehicle) || (player==gunner Local_PlayerVehicle))) then
			{
				_hasLaserScanner=true;				
				_lasers=[];				
				{
					for [{_i=0},{_i<(count _targets)},{_i=_i+1}] do
					{
						if (_x isKindOf (_targets select _i)) then
						{
							_lasers=_lasers+[_x];
						};
					};
				} forEach vehicles;
				//_lasers=nearestobjects [Local_PlayerVehicle,_targets,__LASERDIST];				
			}
			else
			{
				_hasLaserScanner=false;
			};
		};
			
		if (_hasLaserScanner) then
		{			
			_cnt=count _lasers;				
			_i=0;
			_j=0;
			while {(_i<_cnt) && (_j<5)} do
			{
				_target=_lasers select _i;
				if (!isNull _target) then
				{
					_control=_display displayCtrl (6080+_j);					
					_pos=getPosATL _target;
					
					_pos=worldToScreen _pos;							
					
					if ((count _pos)!=0) then
					{								
						_pos set [1,(_pos select 1)-0.08];
						_name=parseText format["<t size='0.8' shadow='true' align='center' color='#FF0000'>Laser</t><br/><t size='0.8' shadow='true' align='center' color='#FFFFFF'>%1m</t><br/><t size='2.0' color='#FF0000' align='center'><img image='ca\ui\data\markers\selector_selectedmission_ca.paa'></t>",round(_target distance Local_PlayerVehicle)];
						[_control,_name,_pos] call _showcontrol
					}
					else
					{
						_control call _hidecontrol;
					};
					_j=_j+1;					
					_laserTargetsShown=true;
				};					
				_i=_i+1;
			};
			if (_laserTargetsShown) then
			{
				while {_j<5} do
				{
					_control=_display displayCtrl (6080+_j);	
					_control call _hidecontrol;					
					_j=_j+1;
				};
			};
		}
		else
		{
			if (_laserTargetsShown) then
			{
				_i=0;
				while {_i<5} do
				{
					_control=_display displayCtrl (6080+_i);	
					_control call _hidecontrol;				
					_i=_i+1;
				};
				_laserTargetsShown=false;
			};			
		};
		
		if (_hasAARadar) then
		{
			if (!isNull System_RadarTrackedAircraft) then
			{
				_control=_display displayCtrl 6080;					
				_pos=getPosATL System_RadarTrackedAircraft;
				_pos set [2,(_pos select 2)+2];
				
				_pos=worldToScreen _pos;						
				
				if ((count _pos)!=0) then
				{				
					_pos set [1,(_pos select 1)-0.018];
					_name=parseText "<t size='2.0' color='#FF0000' align='center'><img image='ca\ui\data\ui_cursor_target_active_ca.paa'></t>";
					[_control,_name,_pos] call _showcontrol;
				}
				else
				{
					_control call _hidecontrol;
				};
				_radarTargetShown=true;
			}
			else
			{
				if (_radarTargetShown) then
				{
					_control=_display displayCtrl 6080;	
					_control call _hidecontrol;				
					_radarTargetShown=false;
				};	
			};
		}
		else
		{
			if (_radarTargetShown) then
			{
				_control=_display displayCtrl 6080;	
				_control call _hidecontrol;				
				_radarTargetShown=false;
			};	
		};
			
		sleep 0.01;
	};
	
	if (_radarTargetShown) then
	{
		_control=_display displayCtrl 6080;	
		_control call _hidecontrol;				
		_radarTargetShown=false;
	};	
	
	System_RadarTrackedAircraft=objNull;