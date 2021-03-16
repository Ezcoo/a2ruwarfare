/*managing script of "Connect","Pick","Repair"  UAV useractions and*/

//remove useraction from user vehicle
_removeaction=
{
	private["_action","_veh"];
	_veh=_this select 0;
	_action=_this select 1;
	
	_action=_veh getVariable format["DAO_WF_ACT_%1UAV",_action];
	if (format["%1",_action]!="<null>") then
	{
		_veh removeAction _action;
	};
};

_veh=Local_PlayerVehicle;
_vehtype=typeof _veh;

_drone=nil;//nearestobject - UAV
_actadded_pick=false;//flag we've allready added "Pick" action
_actadded_activate=false;//flag we've allready added "Connect" action
_actadded_repair=false;//flag we've allready added "Repair" action

while{(alive _veh) && (alive player) && (player in _veh)} do
{
	if ((player==driver _veh) && ((speed _veh)<5)) then
	{
		_UAV=nearestObject [_veh, "Air"];
		//check if nearest aircraft is really an UAV
		if (!(isNull _UAV) && (alive _UAV) && ((typeOf _UAV) in UAV_VehicleTypes)) then
		{					
			//check if the UAV is not allready activated and is going to fly
			//also check distance
			if (!((_UAV getVariable "uav_status_active") select 0) && ((_UAV distance _veh) < 15)) then
			{				
				_attached_to=_UAV getVariable "uav_attached_to";//the vehicle this uav is allready attached to				
				_repair=_UAV getVariable "uav_repair";//time when the uav was repaired last
				_attached=_veh getVariable "uav_attached";//uav allready attached to player vehicle			
				_active=_veh getVariable "uav_active";//uav allready connected to player vehicle				
				
				//if "Pick" is not added
				if (!_actadded_pick) then
				{
					//if UAV is not attached to any vehicles, nothing is attached to player vehicle
					if (((isNull _attached) || !(alive _attached) || ((_attached distance _UAV)>10)) && ((isNull _attached_to) || !(alive _attached_to))) then
					{
						_drone=_UAV;					
						_actadded_pick = true;					
						_name=gettext(configFile >> "CfgVehicles" >> (typeof _drone) >> "displayName");
						_action=_veh addAction ["<t color='#FFF37A'>"+format[localize "STR_UAV_PickUAV",_name]+"</t>","Addon\Valhalla\UAV\Script_UAV_Actions.sqf",[1,_drone],90,false,true,"", ""];
						_veh setVariable ["DAO_WF_ACT_PickUAV",_action];	
					};
				}
				else
				{
					//if we have another uav or somebody attached our uav, or we attached anything else
					if ((_UAV!=_drone) || (!(isNull _attached) && (alive _attached) && ((_attached distance _UAV)<10)) || (!(isNull _attached_to) && (alive _attached_to))) then
					{
						[_veh,"Pick"] call _removeaction;
						_actadded_pick = false;
					};
				};	

				//if "Activate" is not added
				if (!_actadded_activate) then
				{
					//if no uav's are activated by player vehicle
					if ((isNull _active) || !(alive _active)) then
					{
						_drone=_UAV;					
						_actadded_activate = true;					
						_name=gettext(configFile >> "CfgVehicles" >> (typeof _drone) >> "displayName");
						_action=_veh addAction ["<t color='#2BB8FF'>"+format[localize "STR_UAV_ConnectUAV",_name]+"</t>","Addon\Valhalla\UAV\Script_UAV_Actions.sqf",[4,_drone],91,false,true,"", ""];
						_veh setVariable ["DAO_WF_ACT_ActivateUAV",_action];	
					};
				}
				else
				{
					//if we have another uav, or some another uav's are activated
					if ((_UAV!=_drone) || (!(isNull _active) && (alive _active))) then
					{
						[_veh,"Activate"] call _removeaction;
						_actadded_activate = false;
					};
				};	
				
				//if "Repair" is not added
				if (!_actadded_repair) then
				{
					//if nobody is repairing the uav, and uav is damaged
					if ((_repair < time) && (((getDammage _UAV) > 0.05) || !(canMove _UAV))) then
					{
						_drone=_UAV;					
						_actadded_repair = true;					
						_name=gettext(configFile >> "CfgVehicles" >> (typeof _drone) >> "displayName");
						_action=_veh addAction ["<t color='#4C4FFF'>"+format[localize "STR_UAV_RepairUAV",_name]+"</t>","Addon\Valhalla\UAV\Script_UAV_Actions.sqf",[5,_drone],95,false,true,"", ""];
						_veh setVariable ["DAO_WF_ACT_RepairUAV",_action];	
					};
				}
				else
				{
					//if we have another uav, or uav is under repair, or it is not damaged
					if ((_UAV!=_drone) || (_repair >= time) || ((((getDammage _UAV) <= 0.05) && (canMove _UAV)))) then
					{
						[_veh,"Repair"] call _removeaction;
						_actadded_repair = false;
					};
				};			
			}
			else
			{
				//remove all added actions
				if (_actadded_pick) then
				{
					[_veh,"Pick"] call _removeaction;
					_actadded_pick = false;
				};
				if (_actadded_activate) then
				{
					[_veh,"Activate"] call _removeaction;
					_actadded_activate = false;
				};
				if (_actadded_repair) then
				{
					[_veh,"Repair"] call _removeaction;
					_actadded_activate = false;
				};
			};
		}
		else
		{
			//remove all added actions
			if (_actadded_pick) then
			{
				[_veh,"Pick"] call _removeaction;
				_actadded_pick = false;
			};
			if (_actadded_activate) then
			{
				[_veh,"Activate"] call _removeaction;
				_actadded_activate = false;
			};
			if (_actadded_repair) then
			{
				[_veh,"Repair"] call _removeaction;
				_actadded_activate = false;
			};
		};
	}
	else
	{
		//remove all added actions
		if (_actadded_pick) then
		{
			[_veh,"Pick"] call _removeaction;
			_actadded_pick = false;
		};
		if (_actadded_activate) then
		{
			[_veh,"Activate"] call _removeaction;
			_actadded_activate = false;
		};
		if (_actadded_repair) then
		{
			[_veh,"Repair"] call _removeaction;
			_actadded_activate = false;
		};
	};
	sleep 0.75;
};

[_veh,"Pick"] call _removeaction;
[_veh,"Activate"] call _removeaction;
[_veh,"Repair"] call _removeaction;

