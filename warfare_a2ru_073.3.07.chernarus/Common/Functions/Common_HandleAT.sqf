private ["_unit","_weapon","_limit","_ammo","_rocket","_distance","_pos","_speed","_at","_r","_init","_target","_aa","_rocketpos","_vel","_norm","_velnorm","_speedlimit","_startingspeed","_acceleration","_trvldis","_velo","_velonorm","_velonormed","_nvector","_vectornormed","_velguided","_velguidednorm","_velguidednormed","_firepos","_dis","_timetoimpact","_trgvel","_agl","_prediction","_agl","_targetpos","_vector"];
_unit = _this select 0;
_weapon = currentWeapon _unit;
_ammo = _this select 4;
_agl = 0;
_agl= 0.000002;

_pos=getPos _unit;
_speed=1500;
_rocket = nearestObject [_unit,_ammo];
_distance = _rocket distance _pos;

if (isNull _rocket) exitwith {};

_at=["M_AT13_AT","M_47_AT_EP1","Bo_Mk82","Bo_FAB_250","M_TOW_AT"];

_aa = ["M_Stinger_AA","M_Igla_AA","M_Strela_AA"];

// --- ATrockets Handle :
//---Launchers

if (_ammo in _at) then { 


switch(true) do{
case(_ammo isKindOf "M_AT13_AT"):       {_limit = 2000};
case(_ammo isKindOf "M_47_AT_EP1"):     {_limit = 1000};
case(_ammo isKindOf "M_TOW_AT"):        {_limit = 2000};
case(_ammo isKindOf "Bo_Mk82"):     	{_limit = missionNamespace getVariable "WFBE_C_GAMEPLAY_MISSILES_RANGE";};
case(_ammo isKindOf "Bo_FAB_250"):      {_limit = missionNamespace getVariable "WFBE_C_GAMEPLAY_MISSILES_RANGE";};
				};


if(_distance < _limit) then {

        waitUntil {_rocket distance _pos > _limit};

             _r="Misc_Backpackheap_EP1" createVehicle [0,0,0];
			 _rocketpos = getPos _rocket;
			
			 _vel = velocity _rocket;
			 _norm = _vel distance [0,0,0];if (_norm == 0) exitWith {};
			 _velnorm = [(_vel select 0)/_norm,(_vel select 1)/_norm,(_vel select 2)/_norm];
			 _rocketpos = [(_rocketpos select 0) + (_velnorm select 0),(_rocketpos select 1) + (_velnorm select 1),(_rocketpos select 2) + (_velnorm select 2)];
             _r setPos (_rocketpos);
			 sleep 0.1;
            
             deletevehicle _r;			
                          };
                             };
if (!(_ammo in _aa)) exitWith {};

switch (true) do {
case (_ammo isKindOf "M_Igla_AA") : {_speedlimit = 700;_acceleration = 0.5;_agl = 0.015;_init = 0.5;_prediction= 0.2;};
case (_ammo isKindOf "M_Stinger_AA") : {_speedlimit = 700;_acceleration = 0.5;_agl = 0.015;_init = 0.5;_prediction= 0.2;};
};

if (isPlayer _unit) then {_target =cursorTarget}else{_target = assignedTarget _unit;};
if (isNull _target) exitWith {};
_firepos = getPosASL _rocket;
_startingspeed = (velocity _rocket) distance [0,0,0];
_speed = _startingspeed + 0.5;
sleep _init;
While {!isNull _rocket} do{

_dis = _firepos distance (getPosASL _target);
_trvldis = _firepos distance _rocket;
_trgvel=velocity _target;

_timetoimpact = _prediction*((_rocket distance _target)/(velocity _rocket distance [0,0,0]));
_targetpos = [(getPosASL _target select 0) +(_timetoimpact)*(_trgvel select 0),(getPosASL _target select 1)+(_timetoimpact)*(_trgvel select 1),(getPosASL _target select 2)+(_timetoimpact)*(_trgvel select 2) +0.8];

if (_trvldis > _dis) then {_agl=0;breakTo "OUT";};

_velo = velocity _rocket;
_velonorm = _velo distance [0,0,0];
_velonormed = [(_velo select 0)/_velonorm,(_velo select 1)/_velonorm,(_velo select 2)/_velonorm];

_nvector =_targetpos distance (getPosASL _rocket);
_vector =[(_targetpos select 0)-((getPosASL _rocket) select 0),(_targetpos select 1)-((getPosASL _rocket) select 1),(_targetpos select 2)-((getPosASL _rocket) select 2)];
_vectornormed = [((_vector select 0)/_nvector),((_vector select 1)/_nvector),((_vector select 2)/_nvector)];
_time = _trvldis/_speed;
_speed = _speedlimit - (_speedlimit-_startingspeed) * exp( (-1)*_acceleration*(_time));

_velguided = [_agl*(_vectornormed select 0) + (_velonormed select 0),_agl*(_vectornormed select 1) + (_velonormed select 1),_agl*(_vectornormed select 2) + (_velonormed select 2)];
_velguidednorm =_velguided distance [0,0,0];
_velguidednormed = [(_velguided select 0)/_velguidednorm,(_velguided select 1)/_velguidednorm,(_velguided select 2)/_velguidednorm];

_rocket setvectorDirandUp [[(_velguidednormed select 0),(_velguidednormed select 1),(_velguidednormed select 2)],[0,0,1]];
_rocket setVelocity [(_velguidednormed select 0)*_speed,(_velguidednormed select 1)*_speed,(_velguidednormed select 2)*_speed];    
};
scopeName "OUT";




