/*Script highlights targets when uav sees them*/

disableSerialization;

//launched by Func_UAV_HandleDialog
_display=_this select 0;
_mode=_this select 1;
_UAV=_this select 2;

//routine that shows control on the screen
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
	
//routine that hides control
_hidecontrol=
{
	_control ctrlSetStructuredText parseText "";			
};

_img="";
_view=paramsArray select 3;//max marker show distance will be viewDistance-dependent
_maxView=_view/2;//max distance to show tags
_minFov=_this select 3;//min UAV zoom level
_UAV setVariable ["uav_cam_fov",_minFov];//current uav cam zoom

_markerColor='#CCCCCC';//white marker color for RU uav
if (_mode==1) then//shows wether RU or US dialog is running
{
	_markerColor='#1CFF0C';//green - for US uav
};

//get mhq types to show them properly
_hq=[];
{
	_hq=_hq+[typeOf _x]
} forEach (([] call Config_EastMHQ)+([] call Config_WestMHQ));

_timer=0;
_objects=[];
_safeZone=true;

_j=0;
_i=0;
_player=player;
while {(alive _UAV) && (dialog) && (Local_PlayerVehicle!=_player)} do//condition the same to Func_UAV_HandleDialog main cycle
{
	_t=time;
	if (_timer < _t) then
	{
		/*_objects=nearestObjects[screenToWorld[0.5,0.5],["Man","LandVehicle","Air"],400];*/
		_objects=(call Local_EnemyPlayers) + vehicles;

		//don't show anything if UAV is in safezone
		if ((_UAV distance Local_FriendlyBaseFlag) < Config_RespawnSafeZone) then {_safeZone=false;} else {_safeZone=true;};
		
		_timer=_t+1;		
	};
	
	if (_safeZone) then
	{
		_i=0;
		{
			//get control
			_control=_display displayCtrl (6020+_i);		
			if (((typeName _x)=="OBJECT") && (_i < 60)) then
			{			
				//calculate max distance to show markers
				//max dist depends on: fly alittude, current zoom, viewDistance			
				if (((side _x)==Local_EnemySide) || ((_x getVariable "dao_wf_side")==Local_EnemySide)) then
				{		
					_veh=vehicle _x;
					_dst=_veh distance _UAV;
					_maxDist=(((getPosATL _UAV) select 2)/3500*_view*_minFov/(_UAV getVariable "uav_cam_fov")) min _maxView;		
					//if target is close enough to the uav - highlight it
					if (_dst <= _maxDist) then
					{					
						//don't mark single vehicle with several markers
						if ((_x==_veh) || (_x==effectiveCommander _veh)) then
						{	
							//calculate on-screen marker pos
							_pos=worldToScreen (getPosATL _veh);
							//if player is able to see marker
							if ((count _pos)!=0) then
							{								
								//mark different vehicle types with different markers
								switch (true) do
								{	
									case ((typeOf _veh) in _hq):
									{
										_img="o_hq.paa";
									};
									case (_veh isKindOf "Man"):
									{
										_img="o_inf.paa";
									};				
									case (_veh isKindOf "Wheeled_APC"):
									{
										_img="n_mech_inf.paa";
									};
									case (_veh isKindOf "Car"):
									{
										_img="n_motor_inf.paa";
									};
									case (_veh isKindOf "Tank"):
									{					
										_img="n_armor.paa";
									};
									case (_veh isKindOf "StaticWeapon"):
									{					
										_img="o_mortar.paa";
									};									
									default
									{
										_img="o_unknown.paa";
									};
								};	
								//prepare data for marker and show it
								_name="<t size='0.85' color='%2' align='center'><img image='\ca\ui\data\markers\%1'></t>";
								_name=parseText format[_name,_img,_markerColor];															
								[_control,_name,_pos] call _showcontrol;
								_i=_i+1;
							}
							else
							{
								_control call _hidecontrol;
							};
						}
						else
						{
							_control call _hidecontrol;
						};							
					}					
					else
					{
						_control call _hidecontrol;
					};
				}
				else
				{
					_control call _hidecontrol;
				};
			}
			else
			{
				_control call _hidecontrol;
			};	
		} forEach _objects;
	};
	
	//hide controls that are unused, but remain shown from last cycle iteration
	for [{_k=_i}, {_k<_j}, {_k=_k+1}] do
	{
		_control=_display displayCtrl (6020+_k);
		_control call _hidecontrol;
	};
		
	_j=_i;
	sleep 0.01;
};