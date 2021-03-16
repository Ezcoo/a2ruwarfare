private ["_unit","_weapon","_rocket","_ammo","_init","_velonormed","_velo","_velonorm","_nvector",
"_vector","_vectornormed","_velguided","_velguidednorm","_velguidednormed","_target","_firepos","_speed","_dis","_trvldis","_speedlimit","_apply","_special","_topfactor",
"_startingspeed","_acceleration","_agl","_staragl","_agl","_targetype","_restypes",
"_missiles","_targetvelo","_targetvelonorm","_targetvelonormed","_targetpos","_trgvel","_timetoimpact","_leftdis","_topdist","_prediction","_time"];


_unit = _this select 0;
_weapon = currentWeapon _unit;
_ammo = _this select 4;


_init =getNumber(configFile >> "CfgAmmo" >> _ammo >> "inittime");
_rocket = nearestObject [_unit,_ammo];

if (isNull _rocket) exitwith {};


_missiles = ["M_Stinger_AA","M_Strela_AA","M_Igla_AA"];

_restypes =[];
_speedlimit = 0;
_time=0;
_acceleration = 0;

_agl= 0.002;
_init = 0;
_apply =false;
_special =0;
_topfactor = 0;
_topdist= 0;

if (!(_ammo in _missiles)) exitWith{};

Switch (true) do {
case (_ammo isKindOf "M_Igla_AA") : {_restypes =["Building"];_speedlimit = 700;_acceleration = 0.4;_agl = 0.007;_init = 0.2;_special=1;_prediction= 0.1;};
case (_ammo isKindOf "M_Stinger_AA") : {_restypes =["Building"];_speedlimit = 700;_acceleration = 0.4;_agl = 0.007;_init = 0.2;_special=1;_prediction= 0.1;};
};

if (isPlayer _unit) then {_target =cursorTarget}else{_target = assignedTarget _unit};
_targetype =typeOf _target;
_firepos = getPosASL _rocket;

_apply= if(isNull _target || _unit aimedAtTarget [_target] == 0 || {_targetype isKindOf _x} count _restypes != 0 || _special == 0) then {false}else{true};
switch (true) do {

case (!_apply) : {
sleep _init;

_startingspeed = (velocity _rocket) distance [0,0,0];
_speed = _startingspeed;
While {!isNull _rocket} do{
                          
                        _velo = velocity _rocket; 
                        _velonorm = _velo distance [0,0,0];
                        _velonormed = [(_velo select 0)/_velonorm,(_velo select 1)/_velonorm,(_velo select 2)/_velonorm];
                       
                         _trvldis = _firepos distance _rocket; 
						 _time = _trvldis/_speed;
                        _speed = _speedlimit - (_speedlimit-_startingspeed) * exp( (-1)*_acceleration*(_time));                        
                    _rocket setVelocity [(_velonormed select 0)*_speed ,(_velonormed select 1)*_speed,(_velonormed select 2)*_speed];
};};
case (_special == 1) :{
sleep _init;
_startingspeed = (velocity _rocket) distance [0,0,0];
_speed = _startingspeed;
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


//if (typeOf _unit == "Su34") then {hintsilent format ["%1",_agl]};
_velguided = [_agl*(_vectornormed select 0) + (_velonormed select 0),_agl*(_vectornormed select 1) + (_velonormed select 1),_agl*(_vectornormed select 2) + (_velonormed select 2)];
_velguidednorm =_velguided distance [0,0,0];
_velguidednormed = [(_velguided select 0)/_velguidednorm,(_velguided select 1)/_velguidednorm,(_velguided select 2)/_velguidednorm];

                                                 
                                                  
_rocket setvectorDirandUp [[(_velguidednormed select 0),(_velguidednormed select 1),(_velguidednormed select 2)],[0,0,1]];
_rocket setVelocity [(_velguidednormed select 0)*_speed,(_velguidednormed select 1)*_speed,(_velguidednormed select 2)*_speed];   
};};

case (_special == 2 ) : {
sleep _init;
_startingspeed = (velocity _rocket) distance [0,0,0];
_speed = _startingspeed;
While {!isNull _rocket} do{

_dis = _firepos distance (getPosASL _target);
_trvldis = _firepos distance _rocket;
_targetpos = [(getPosASL _target select 0),(getPosASL _target select 1),(getPosASL _target select 2) + _topfactor*_dis/_trvldis];
if (_trvldis > _dis) then {_agl=0;breakTo "OUT";};
 if ([getPosASL _target select 0,getPosASL _target select 1] distance [getPosASL _rocket select 0,getPosASL _rocket select 1] < _topdist) then {breakTo "OUT";};
/* if ([getPosASL _target select 0,getPosASL _target select 1] distance [getPosASL _rocket select 0,getPosASL _rocket select 1] < _topdist) then {_targetpos = [(getPosASL _target select 0),(getPosASL _target select 1),(getPosASL _target select 2)+0.8]}; */
_velo = velocity _rocket;
_velonorm = _velo distance [0,0,0];
_velonormed = [(_velo select 0)/_velonorm,(_velo select 1)/_velonorm,(_velo select 2)/_velonorm];

_nvector =_targetpos distance (getPosASL _rocket);
_vector =[(_targetpos select 0)-((getPosASL _rocket) select 0),(_targetpos select 1)-((getPosASL _rocket) select 1),(_targetpos select 2)-((getPosASL _rocket) select 2)];
_vectornormed = [((_vector select 0)/_nvector),((_vector select 1)/_nvector),((_vector select 2)/_nvector)];
_time = _trvldis/_speed;
_speed = _speedlimit - (_speedlimit-_startingspeed) * exp( (-1)*_acceleration*(_time));

//if (typeOf _unit == "Su34") then {hintsilent format ["%1",_agl]};
_velguided = [_agl*(_vectornormed select 0) + (_velonormed select 0),_agl*(_vectornormed select 1) + (_velonormed select 1),_agl*(_vectornormed select 2) + (_velonormed select 2)];
_velguidednorm =_velguided distance [0,0,0];
_velguidednormed = [(_velguided select 0)/_velguidednorm,(_velguided select 1)/_velguidednorm,(_velguided select 2)/_velguidednorm];

                                                                                                                                                               
_rocket setvectorDirandUp [[(_velguidednormed select 0),(_velguidednormed select 1),(_velguidednormed select 2)],[0,0,1]];
_rocket setVelocity [(_velguidednormed select 0)*_speed,(_velguidednormed select 1)*_speed,(_velguidednormed select 2)*_speed];

                              };};								  
 
};
scopeName "OUT";




