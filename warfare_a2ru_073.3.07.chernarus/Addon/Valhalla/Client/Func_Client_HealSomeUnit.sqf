	//see Func_Client_UpdateUserActions
		
	#include "defines.sqf"
		
	private["_unit"];

	//user action: heal some unit if that is injured
	//or heal player with medical backpack
	if (_this) then
	{
		_pos=getposATL player;
		_unit=nearestObject [[(_pos select 0)+1.5*sin(getDir player), (_pos select 1)+1.5*cos(getDir player), _pos select 2],"Man"];

		if (!(isNull _unit) && (_unit!=player)) then
		{
			//remove disposal medpack, if unit is not a "medic"
			//#ifndef __ARMA2__
			//if (!(typeOf(unitBackPack player) in System_MedicalBackPacks)) then
			//{
			//#endif
				_weapons=weapons player;
				{
					if (_x in _weapons) exitWith
					{
						player removeWeapon _x;						
						[localize "STR_HINT_FirstAid",format[localize "STR_HINT_Medpacks",({_x in System_MedicalDisposalPacks} count (weapons player))],"Addon\Valhalla\pic\heal.paa",1.0] call Func_Client_ShowCustomMessage;
					};
				} forEach System_MedicalDisposalPacks;					
			//#ifndef __ARMA2__
			//};
			//#endif
			
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			_unit playMove "AinvPknlMstpSlayWrflDnon_healed";
			
			Public_UnitHealed=[Local_PlayerName,_unit,player];
			publicVariable "Public_UnitHealed";
			
			sleep 5;
			
			_unit setDamage 0;	
		};
	}
	else
	{
		//remove disposal medpack, if unit is not a "medic"
		//#ifndef __ARMA2__
		//if (!(typeOf(unitBackPack player) in System_MedicalBackPacks)) then
		//{	
		//#endif
			_weapons=weapons player;
			{
				if (_x in _weapons) exitWith
				{
					player removeWeapon _x;
					[localize "STR_HINT_FirstAid",format[localize "STR_HINT_Medpacks",({_x in System_MedicalDisposalPacks} count (weapons player))],"Addon\Valhalla\pic\heal.paa",1.0] call Func_Client_ShowCustomMessage;
				};
			} forEach System_MedicalDisposalPacks;			
		//#ifndef __ARMA2__
		//};
		//#endif	
		
		player playMove "amovppnemstpsraswrfldnon_healed";
		sleep 5;
		player setDamage 0;		
	};
	