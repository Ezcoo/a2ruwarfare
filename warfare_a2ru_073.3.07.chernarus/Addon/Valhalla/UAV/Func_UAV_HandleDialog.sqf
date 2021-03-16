/*handles UAV camera*/

#include "defines.sqf";

_UAV=Local_PlayerVehicle getVariable "uav_active";

if (!isNull _UAV) then
{
	_index=UAV_VehicleTypes find (typeOf _UAV);	
	if (_index>=0) then
	{		
		//see Script_UAV_Actions - we started loading screen there
		progressLoadingScreen 1;
		
		//get some values from uav configFile
		//see Config_Uav.sqf
		_CameraAttachPos=(UAV_VehicleDatas select _index) select 0;
		_CameraMaxDive=(UAV_VehicleDatas select _index) select 1;
		_CameraMinDive=(UAV_VehicleDatas select _index) select 2;
		_CameraMaxFov=(UAV_VehicleDatas select _index) select 3;
		_CameraMinFov=(UAV_VehicleDatas select _index) select 4;
		
		disableSerialization;
	
		_display=(_this select 0) select 0;
		_mode=_this select 1;
		
		//init dialog controls
		//for RU UAV's we need only first to
		//but i'm too lazy to make check and introduce new if's
		_control01=_display displayCtrl 5000;
		_control02=_display displayCtrl 5001;
		_control03=_display displayCtrl 5002;
		_control04=_display displayCtrl 5003;
		_control05=_display displayCtrl 5004;
		_control06=_display displayCtrl 5005;
		_control07=_display displayCtrl 5006;
		_control08=_display displayCtrl 5007;
		//compass
		_compassN=_display displayCtrl 7000;
		_compassS=_display displayCtrl 7001;
		_compassE=_display displayCtrl 7002;
		_compassW=_display displayCtrl 7003;
		_compassU=_display displayCtrl 7004;
		
		_pos=getPos _UAV;
		_dir=getDir _UAV;
		_sensorTarget="emptyDetector" createVehicle _pos;//sensor will be used as camera target
		_sensorAttach="emptyDetector" createVehicle _pos;//sensor will be used to know camera pos concernig the uav. we could also use ModelToWorld, but don't want
		_sensorAttach attachTo [_UAV,_CameraAttachPos];
		
		//check if UAV fly params exist
		if (format["%1",_UAV getVariable "uav_fly_height"]=="<null>") then
		{
			_UAV setVariable ["uav_fly_height",((_pos select 2)-((_pos select 2) mod 10)) max 50];
		};
		if (format["%1",_UAV getVariable "uav_fly_dir"]=="<null>") then
		{
			_UAV setVariable ["uav_fly_dir",_dir-(_dir mod 10)];
		};
		
		//laser designator data
		_lasers="";
		_laserText="Off";
		_laseractive=_UAV getVariable "uav_laser_active";
		_designator=_UAV getVariable "uav_laser_target";
		
		//check if it is US or RU UAV
		_ColorCorrections=[];		
		if (_mode==0) then
		{
			//RU has gray camera color
			_ColorCorrections=[1,1,0,[1,1,1,0],[1.0,1.0,1.0,0.0],[0.2,0.2,0.2,0]];
			//laser designator type
			_lasers="NVG_TargetC";
			//ti mode
			_UAV setVariable ["uav_ti_mode",[0,1]];
		}
		else
		{
			//US has green
			_ColorCorrections=[1,1,0,[0,0,0,0],[0.11,1.0,0.05,0.3],[0.17,0.5,0.12,0.3]];
			//laser designator type
			_lasers="NVG_TargetW";
			//ti mode
			_UAV setVariable ["uav_ti_mode",[2,3]];
		};			
		//apply post-process effect
		_ppColor = ppEffectCreate ["ColorCorrections", 1999];
		_ppColor ppEffectEnable true;
		_ppColor ppEffectAdjust _ColorCorrections;
		_ppColor ppEffectCommit 0;
		
		//fade sound. It would be more realistic to remove it at all, but it is too annoying to drive a uav without any sounds
		0 fadeSound 0.1;
		
		//create camera
		showCinemaBorder false;
		_camera = "camera" CamCreate [0,0,0];
		_camera cameraEffect ["internal","back"];
		_camera camSetTarget _sensorTarget;		

		//determne screen center and non-sensitive zone
		_ScreenCenterX=safeZoneX+safeZoneW/2;
		_ScreenCenterY=safeZoneY+safeZoneH/2;
		_NonSensitiveZone=0.10;
		
		//initial camera params
		_UAV_CamDir=getDir _UAV;
		_UAV_CamDive=_CameraMinDive;
		_UAV_CamFov=_CameraMinFov;
		
		//waypoint timer
		_timer=time;
		//group to manage waypoints
		_group=group (_UAV getVariable "uav_driver");
			
		//UAV_CameraActive stops some client systems which are not necessary now to increase client performance
		UAV_CameraActive=true;
		//reset keyboard block variable - see Func_UAV_KeyPress
		UAV_KeyPressed=false;
		
		/*
		_wiewdistance=Local_ViewDistance;
		setViewDistance (5000 max Local_ViewDistance);
		*/
		endLoadingScreen;
		
		//while the UAV is alive and camera is on
		//if player dies the dialog will be closed by another script, so no need to check player life state
		
		//start targets highlight
		//[_display,_mode,_UAV,_CameraMinFov] spawn Func_UAV_HilightTargets;
		
		_player=player;
		while {(alive _UAV) && (dialog) && (Local_PlayerVehicle!=_player)} do
		{
			//check mouse position on screen - see resource\UAVDialog.hpp
			_MouseMove=WF_Logic getVariable "uav_cam_move";			
			_MouseMoveX=(_MouseMove select 0)-_ScreenCenterX;
			_MouseMoveY=(_MouseMove select 1)-_ScreenCenterY;
			
			//X-Movement; if mouse is out of non-sensitive zone
			_abs=abs _MouseMoveX;
			if (_abs > _NonSensitiveZone) then
			{
				//apply camera rotation. notice: more zoom - less rotation speed				
				_UAV_CamDir=_UAV_CamDir+0.9*_MouseMoveX*(exp _abs)*_UAV_CamFov/_CameraMinFov;
				if (_UAV_CamDir > 360 ) then {_UAV_CamDir=0} else {if (_UAV_CamDir < 0 ) then {_UAV_CamDir=360}};				
			};
			//Y-Movement; if mouse is out of non-sensitive zone
			_abs=abs _MouseMoveY;
			if (_abs > _NonSensitiveZone) then
			{
				//apply camera rotation. notice: more zoom - less rotation speed				
				_UAV_CamDive=_UAV_CamDive-0.9*_MouseMoveY*(exp _abs)*_UAV_CamFov/_CameraMinFov;
				if (_UAV_CamDive < _CameraMaxDive ) then {_UAV_CamDive=_CameraMaxDive} else {if (_UAV_CamDive > _CameraMinDive) then {_UAV_CamDive = _CameraMinDive}};
			};
			//Mouse wheel - see resource\UAVDialog.hpp
			_MouseMove=WF_Logic getVariable "uav_cam_fov";
			if (_MouseMove!=0) then
			{					
				_zoommultiplier=0.015;//defines zoom speed
				//check wheel rotation side
				if (_MouseMove > 0) then {_zoommultiplier=-_zoommultiplier};
				//apply zoom
				_UAV_CamFov=_UAV_CamFov+_zoommultiplier;		
				if (_UAV_CamFov < _CameraMaxFov ) then {_UAV_CamFov=_CameraMaxFov} else {if (_UAV_CamFov > _CameraMinFov) then {_UAV_CamFov=_CameraMinFov}};
				
				//reset mouse wheel move flag
				WF_Logic setVariable ["uav_cam_fov",0];
				//set current zoom level for enemies detection system
				_UAV setVariable ["uav_cam_fov",_UAV_CamFov];
			};	
			
			//auxiliary calculations
			_SinCamDir=sin(_UAV_CamDir);
			_CosCamDir=cos(_UAV_CamDir);
			_direction=direction _UAV;
			
			//get cam pos, and calculate cam target pos, according to camera X/Y angles
			_pos=getPosASL _sensorAttach;
			_sensorTarget setPosASL [(_pos select 0)+10*_SinCamDir*cos(_UAV_CamDive),(_pos select 1)+10*_CosCamDir*cos(_UAV_CamDive),(_pos select 2)+10*sin(_UAV_CamDive)];
			//laser designator
			if (_laseractive) then {_pos=_designator setPos screenToWorld [0.5,0.5]};
			
			//set camera params and wait until they are applied
			_pos=getPos _sensorAttach;
			_camera camSetPos _pos;	
			_camera camSetFov _UAV_CamFov;	
			_camera camCommit 0;
			waitUntil{camCommitted _camera};
			
			//UAV interface - speed mode. Don't like "switch" here, but couldn't imagine nothing else
			_speedmode=speedMode _group;
			switch (_speedmode) do
			{
				case "LIMITED":
				{
					_speedmode="Lim.";
				};
				case "NORMAL":
				{
					_speedmode="Normal";
				};
				case "FULL":
				{
					_speedmode="Full";
				};
			};
			
			//current uav fly params - direction and height - see Func_UAV_KeyPress
			_dir=_UAV getVariable "uav_fly_dir";
			_height=_UAV getVariable "uav_fly_height";
			
			//if RU camera - we need only 2 controls
			if (_mode==0) then
			{
				_control01 ctrlSetStructuredText parseText format["<t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>UAV status:</t><br/><t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>Speed, kph: %1/%2</t><br/><t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>Altitude, m: %3/%4</t><br/><t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>Direction, deg: %5/%6</t><br/><t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>Grid: %7</t>",round (speed _UAV),_speedmode,round ((getPosATL _UAV) select 2),_height,round (direction _UAV),_dir,mapGridPosition _UAV];
				_control02 ctrlSetStructuredText parseText format["<t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>Camera status:</t><br/><t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>Direction, deg: %1</t><br/><t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>Dive, deg: %2</t><br/><t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>Fov: %3x</t><br/><t size='0.7' color='#ffffff' align='left' font='EtelkaMonospaceProBold'>Designator: %4</t>",round _UAV_CamDir,round _UAV_CamDive,round (_CameraMinFov/_UAV_CamFov),_laserText];
			}
			else
			{
				_control01 ctrlSetText format["%1/%2",round (speed _UAV),_speedmode];
				_control03 ctrlSetText format["%1/%2",round ((getPosATL _UAV) select 2),_height];
				_control05 ctrlSetText format["%1/%2",round _direction,_dir];
				_control07 ctrlSetText format["%1",mapGridPosition _UAV];//mapGridPosition _UAV
				_control02 ctrlSetText format["%1",round _UAV_CamDir];
				_control04 ctrlSetText format["%1",round _UAV_CamDive];
				_control06 ctrlSetText format["%1x",round (_CameraMinFov/_UAV_CamFov)];
				_control08 ctrlSetText format["%1",_laserText];
			};
			
			//set compass			
			_compassN ctrlSetPosition [0.4896-0.0599*_SinCamDir,0.475-0.08*_CosCamDir];
			_compassN ctrlCommit 0;
			waitUntil{ctrlCommitted _compassN};
			_compassS ctrlSetPosition [0.4896+0.0599*_SinCamDir,0.475+0.08*_CosCamDir];
			_compassS ctrlCommit 0;
			waitUntil{ctrlCommitted _compassS};			
			_compassE ctrlSetPosition [0.4896+0.0599*_CosCamDir,0.475-0.08*_SinCamDir];
			_compassE ctrlCommit 0;
			waitUntil{ctrlCommitted _compassE};
			_compassW ctrlSetPosition [0.4896-0.0599*_CosCamDir,0.475+0.08*_SinCamDir];
			_compassW ctrlCommit 0;
			waitUntil{ctrlCommitted _compassW};
			_compassU ctrlSetPosition [0.495-0.0599*sin (_UAV_CamDir-_direction),0.492-0.08*cos (_UAV_CamDir-_direction)];
			_compassU ctrlCommit 0;
			waitUntil{ctrlCommitted _compassU};
			
			//set AI waypoint every second
			if (_timer < time) then
			{
				_timer=time+1;
				//we should handle the situation, when one player gets the UAV into the air
				//and another - takes control in some time
				if (local _UAV) then
				{
					_way=waypoints _group;				
					if ((count _way)>1) then
					{
						//if typename is "string" - UAV is in "HOLD" mode - do not change waypoint pos
						//see Func_UAV_KeyPress
						if ((typeName _dir)=="STRING") then				
						{
							(_way select 1) setWPPos (_UAV getVariable "uav_cruise_pos");
						}
						else
						{					
							_pos=position _UAV;
							(_way select 1) setWPPos [(_pos select 0)+10*_height*sin(_dir),(_pos select 1)+10*_height*cos(_dir),0];
						};
					}
					else
					{
						//if the UAV was in flight - make new waypoints
						_group=group (_UAV getVariable "uav_driver");						
						if ((_UAV getVariable "uav_status_active") select 0) then
						{																	
							_way=_group addWaypoint [getPos _UAV,500,1];
							_way setWaypointBehaviour "careless";
							_way setWaypointCombatMode "blue";
							_way setWaypointType "HOLD";
						};
					};
				}
				else
				{		
					//if player controlling the uav has changed
					//we should make the uav local to his PC
					if (_UAV call Func_UAV_CheckPilot) then
					{		
						//if the UAV was in flight - make new waypoints
						_group=group (_UAV getVariable "uav_driver");						
						if ((_UAV getVariable "uav_status_active") select 0) then
						{																	
							_way=_group addWaypoint [getPos _UAV,500,1];
							_way setWaypointBehaviour "careless";
							_way setWaypointCombatMode "blue";
							_way setWaypointType "HOLD";
						};
					};					
				};
				//laser designator
				_designator=_UAV getVariable "uav_laser_target";
				if (_UAV getVariable "uav_laser_active") then
				{			
					if (isNull _designator) then
					{
						_designator=createVehicle [_lasers,[16000,16000,500],[],50,"none"];
						_UAV setVariable ["uav_laser_target",_designator,true];	
						
						#ifdef __USE_ACE__
						_designator setVehicleInit "[this] spawn ace_sys_missileguidance_fnc_laser_init";
						processInitCommands;
						#endif
					}
					else
					{
						if (!local _designator) then
						{
							deleteVehicle _designator;
						};
					};
					_laserText="On";
					_laseractive=true;
				}
				else
				{
					if (!isNull _designator) then
					{
						deleteVehicle _designator;
					};
					_laserText="Off";
					_laseractive=false;
				};
			};
			
			sleep 0.01;
		};
		
		//reset camera params
		false setCamUseTi 0;	
		UAV_TiMode=0;
		
		if (alive player) then
		{
			//dialog is closed or the UAV is dead
			_camera cameraEffect ["terminate","back"];
			camDestroy _camera;
		};		
		
		//laser designator
		deleteVehicle _designator;
		
		//delete working objects
		deleteVehicle _sensorAttach;
		deleteVehicle _sensorTarget;		
		ppEffectDestroy _ppColor;
		
		0 fadeSound 1;
		
		closeDialog 0;//close uav dialog
		closeDialog 0;//close map, if it was opened
		
		//launch stopped mission systems
		UAV_CameraActive=false;	

		/*setViewDistance _wiewdistance;*/
	};
};