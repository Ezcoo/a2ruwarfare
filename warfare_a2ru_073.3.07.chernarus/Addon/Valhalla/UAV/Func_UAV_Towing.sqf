/**/
//don't know who is author of this script, so couldn't include him to credits and ask permission to use his code

_T=_this select 0;
_P=_this select 1;
_T_axis_offset=(_this select 2)+[0];
_P_axis_offset=(_this select 3)+[0];
_P_wheel_offset=(_this select 4)+[0];

/**/
_dirdeg=getDir _T;
_aTpos=_T modelToWorld _T_axis_offset;
_aPpos=_P modelToWorld _P_axis_offset;

_xP=(_aTpos select 0)-((_P_axis_offset select 1)*sin _dirdeg);
_yP=(_aTpos select 1)-((_P_axis_offset select 1)*cos _dirdeg);
_P setdir _dirdeg;
_P setpos [_xP, _yP, 0];

_dam=getDammage _P;
/**/
while {(alive _T) && (alive _P) && !(isNull _T) && !(isNull _P) && (local _T) && (local _P)} do 
{
	_aTpos=_T modelToWorld _T_axis_offset;
	_aPpos=_P modelToWorld _P_axis_offset;
	_wheelPpos=_P modelToWorld _P_wheel_offset;

	_dx_axis=(_aTpos select 0)-(_aPpos select 0);
	_dy_axis=(_aTpos select 1)-(_aPpos select 1);		
	_d_axis=sqrt((_dx_axis)^2+(_dy_axis)^2);

	if(_d_axis>0.05) then 
	{		
		_dx=(_aTpos select 0)-(_wheelPpos select 0);
		_dy=(_aTpos select 1)-(_wheelPpos select 1);		
		_dirdeg=_dx atan2 _dy;
			
		_Ppb=_P call Func_System_GetPitchBank;
		_P setdir _dirdeg;
		[_P,_Ppb select 0,_Ppb select 1] call Func_System_SetPitchBank;			
		
		_dirdeg_axis=_dx_axis atan2 _dy_axis;
		_speed=_d_axis*8;
		_speed=_speed min 50;
		_Pvel=velocity _P;	
		_P setVelocity [(sin _dirdeg_axis*_speed),(cos _dirdeg_axis*_speed),(_Pvel select 2)-0.3];		
	};
	sleep 0.01;
	
	_T=_P getVariable "uav_attached_to";
	_P=_T getVariable "uav_attached";
	_P setDamage _dam;
	
	_sp=speed _T;
	if ((_sp > 40) || (_sp < -20)) then
	{
		_v=velocity _T;
		_T setVelocity [(_v select 0)*0.8,(_v select 1)*0.8,(_v select 2)*0.8];
	};
};

_P setVariable ["uav_attached_to",objNull,true];
_T setVariable ["uav_attached",objNull,true];