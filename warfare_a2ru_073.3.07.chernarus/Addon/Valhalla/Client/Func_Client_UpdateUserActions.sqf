player addAction ["<t color='#4C4FFF'>"+(localize "STR_ACT_Heal")+"</t>","Addon\Valhalla\Client\Script_Client_Actions.sqf",[3],-104,false,true,"", "(nearestObject [[(getposATL _target select 0)+1.5*sin(getDir _target),(getPosATL _target select 1)+1.5*cos(getDir _target), (getposATL _target select 2)],""Man""] != _target) && ((getDammage nearestObject [[(getposATL _target select 0)+1.5*sin(getDir _target), (getPosATL _target select 1)+1.5*cos(getDir _target), (getposATL _target select 2)],""Man""]) > 0.05) && (alive nearestObject [[(getposATL _target select 0)+1.5*sin(getDir _target), (getPosATL _target select 1)+1.5*cos(getDir _target), (getposATL _target select 2)],""Man""]) && ((side nearestObject [[(getposATL _target select 0)+1.5*sin(getDir _target), (getPosATL _target select 1)+1.5*cos(getDir _target), (getposATL _target select 2)],""Man""])==Local_PlayerSide) && (alive _target) && ((vehicle _target)==_target) && ((animationState _target)!=""AinvPknlMstpSlayWrflDnon_medic"") && ((({_x in System_MedicalDisposalPacks} count (weapons _target)))>0)"];		
player addAction ["<t color='#4C4FFF'>"+(localize "STR_ACT_HealThyself")+"</t>","Addon\Valhalla\Client\Script_Client_Actions.sqf",[23],-104,false,true,"", "((getDammage _target) > 0.05) && (alive _target) && ((vehicle _target)==_target) && ((animationState _target)!=""AinvPknlMstpSlayWrflDnon_medic"") && ((({_x in System_MedicalDisposalPacks} count (weapons _target)))>0)"];	