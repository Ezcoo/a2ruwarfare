	/*UAV steering script*/
	
	#include "defines.sqf"
	
	/*some auxiliary functions*/
	_heightadjust=
	{
		private["_UAV","_adjust","_height"];
		
		_UAV=_this select 0;
		_adjust=_this select 1;
		
		_height=_UAV getVariable "uav_fly_height";
		_height=_height+_adjust;
		
		//min and max height limit for uav are defuned here
		if (_height > 1000) then 
		{
			_height=1000;
		} 
		else
		{
			if (_height < 50) then 
			{
				_height=50;
			};		
		};		
		
		_UAV flyInHeight _height;
		_UAV setVariable ["uav_fly_height",_height];
	};
	//direction adjustment
	_diradjust=
	{		
		private["_UAV","_adjust","_dir"];
		
		_UAV=_this select 0;
		_adjust=_this select 1;
		
		//just change control variable
		//see Func_UAV_HandleDialog for flight direction algorithms
		_dir=_UAV getVariable "uav_fly_dir";
		
		if ((typeName _dir)=="STRING") then 
		{
			_dir=getDir _UAV;
			_dir=_dir-(_dir mod 10);
		}
		else
		{
			_dir=_dir+_adjust;
			if (_dir < 0) then 
			{
				_dir=350;
			}
			else
			{
				if (_dir > 350) then 
				{
					_dir=0
				};
			};
		};
		
		_UAV setVariable ["uav_fly_dir",_dir];					
		_UAV setVariable ["uav_cruise_pos",[]];
	};
	/*script start*/
	_key=_this select 1;
	_shift=_this select 2;
	_ctrl=_this select 3;
	_alt=_this select 4;
		
	_denyaction=false;
		
	_UAV=Local_PlayerVehicle getVariable "uav_active";
	
	if ((!isNull _UAV)) then
	{
		if (alive _UAV) then
		{
			switch (_key) do
			{
				case 17://W - increase fly height
				{					
					[_UAV,10] call _heightadjust;
				};
				case 31://S - decrease fly height
				{
					[_UAV,-10] call _heightadjust;				
				};
				case 30://A - turn left
				{
					[_UAV,-5] call _diradjust;
				};
				case 32://D - turn right
				{					
					[_UAV,5] call _diradjust;
				};
				case 19://R - fly faster
				{
					_group=group _UAV;
					_mode=toUpper (speedMode _group);
					switch (_mode) do
					{
						case "LIMITED":
						{
							_group setSpeedMode "NORMAL";
						};
						case "NORMAL":
						{
							_group setSpeedMode "FULL";
						};
						case "FULL":
						{
							_group setSpeedMode "FULL";
						};
					};
				};
				case 33://F - fly slower
				{
					_group=group _UAV;
					_mode=toUpper (speedMode _group);
					switch (_mode) do
					{
						case "LIMITED":
						{
							_group setSpeedMode "LIMITED";
						};
						case "NORMAL":
						{
							_group setSpeedMode "LIMITED";
						};
						case "FULL":
						{
							_group setSpeedMode "NORMAL";
						};
					};			
				};
				case 49://N - Tnermal vision
				{
					if (!UAV_KeyPressed) then
					{	
						_modes=_UAV getVariable "uav_ti_mode";
						_count=count _modes;
						
						if (_count > 0) then
						{
							UAV_TiMode=UAV_TiMode+1;
							if (UAV_TiMode > _count) then
							{
								UAV_TiMode = 0;
								false setCamUseTi 0;
							}
							else
							{
								true setCamUseTi (_modes select (UAV_TiMode - 1));
							};
						};						
					};
				};
				#ifndef __ARMA2__
				case 34://G - switch laser designator
				{
					if (!UAV_KeyPressed) then
					{	
						UAV_KeyPressed=true;
						_status=_UAV getVariable "uav_laser_active";
						_UAV setVariable ["uav_laser_active",!_status,true];
					};
				};
				#endif
				case 57://Space
				{
					//Ctrl+Space - Hold position
					if (!UAV_KeyPressed) then
					{								
						switch (true) do
						{
							case _ctrl:
							{
								//Keyboard lock - if buttons are holded down
								//onKeyUp in resource\UAVDialog.hpp performss flag reset
								UAV_KeyPressed=true;
								
								_pos=screenToWorld [0.5,0.5];
								if ((count _pos) > 0) then
								{					
									if ((_pos select 2) < 10) then
									{
										_UAV setVariable ["uav_cruise_pos",_pos];
										_UAV setVariable ["uav_fly_dir","HOLD"];							
									};
								};
							};
							case _shift:
							{
								//Keyboard lock - if buttons are holded down
								//onKeyUp in resource\UAVDialog.hpp performss flag reset
								UAV_KeyPressed=true;
								
								_pos=getPos _UAV;
								_pos set [2,0];
								
								_UAV setVariable ["uav_cruise_pos",_pos];
								_UAV setVariable ["uav_fly_dir","HOLD"];															
							};
							default
							{
								//Space - Spot target
							
								//Keyboard lock - if space is holded down
								//onKeyUp in resource\UAVDialog.hpp performss flag reset
								UAV_KeyPressed=true;
								
								//nearest object to screen center
								_pos=screenToWorld [0.5,0.5];
								_object=nearestObject [_pos,"Land"];
								if (!isNull _object) then
								{							
									//if the object is not friendly, UAV is flying, and object is not too far
									if (((_object distance _pos)<8) && ((_object distance _UAV)<viewDistance) && (!((side _object) in [Local_PlayerSide,civilian])) && (alive _object) && ((_UAV getVariable "uav_status_active") select 0)) then
									{
										//track the object for some time
										#ifdef __ARMA2__
										_time=_object getVariable "uav_track_time";
										if (format["%1",_time]=="<null>") then
										{
											_time=0;
										};
										#else
										_time=_object getVariable ["uav_track_time",0];
										#endif
										_object setVariable ["uav_track_time",serverTime+Config_UAVDetectionTime,true];
										//remember the operator to award him
										_object setVariable ["uav_track_operator",player,true];
										
										//if object is not allready tracked
										if (_time < serverTime) then
										{
											//start tracking - show radio MSG									
											player commandChat format[localize "STR_UAV_Radio",mapGridPosition _object];
							
											//send info to the remote clients
											//see uav\precompile.sqf and Func_UAV_ShowDetectedObjects
											Public_UAVDetectedObject=[_object,player];
											publicVariable "Public_UAVDetectedObject";
											
											//mark teh object on local machine - Func_UAV_ShowDetectedObjects
											UAV_DetectedObjects set [count UAV_DetectedObjects,_object];
											_bounty = 300;
											_bounty Call ChangePlayerFunds;
											
											
										}
										else
										{
											//show local message the object is being tracked
											//and renew its tracktime
											player groupChat localize "STR_UAV_RadioTracked";
											_object setVariable ["uav_track_time",serverTime+Config_UAVDetectionTime,true];
										};
									};
								};
							};							
						};						
					};
				};
				case 28://Enter
				{	
					//landing function
					
					if (!UAV_KeyPressed) then
					{		
						//Keyboard lock - if Enter is holded down
						//onKeyUp in resource\UAVDialog.hpp performss flag reset
						UAV_KeyPressed=true;						
						
						_index=UAV_VehicleTypes find (typeOf _UAV);	
						_function=compile format["%1",(UAV_VehicleDatas select _index) select 6];
						_UAV call _function;					
					};
				};
				/*				
				case 16://Q
				{	
					//fire
					_designator=_UAV getVariable "uav_laser_target";
					if ((!isNull _designator) && ((count (weapons _UAV))>0)) then
					{		
						if ((_UAV aimedAtTarget [_designator,(weapons _UAV) select 0])>0.0) then
						{
							_UAV fireAtTarget [_designator,(weapons _UAV) select 0];
							player sideChat "Fire!"
						};						
					};
				};				
				*/
				case 50://M
				{
					createDialog "RscUAVMap";				
				};
				//default{player sideChat format["%1",_this]};
			};			
		};
	};


	_denyaction