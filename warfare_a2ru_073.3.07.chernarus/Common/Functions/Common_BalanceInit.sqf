switch (typeOf _this) do {
	    case "M6_EP1": {
		
		_this removeWeapon "M242BC";
        _this addWeapon "M230";
        _this addMagazine "1200Rnd_30x113mm_M789_HEDP";
	
        _this removeWeapon "StingerLaucher_4x";
        _this addMagazine "8Rnd_9M311";
        _this addWeapon "9M311Laucher";
        _rocketEH = _this getVariable "M6_9M311LaucherEH";
        if (isNil "_rocketEH") then {
            _this setVariable ["M6_9M311LaucherEH", 1, true];
            _this addEventHandler["Fired", { _this spawn {
                private['_missile', '_type', '_launchPosition'];
                _missile = _this select 6;
                _type = typeof _missile;
                if (_type == "M_9M311_AA") then {
                    _launchPosition = position _missile;
                    _range = 5000 + ((random 1) - 0.5)*1000;
                    waitUntil { !(alive _missile) || _launchPosition distance _missile > _range};
                    if (alive _missile) then {
                        deleteVehicle _missile;        
                        //hint format["Missile SelfDestruction at %1", _launchPosition distance _missile];
                    };            
                };
            }}];
        }
    };
	case "A10": {
		_this removeWeapon "BombLauncherA10";
		_this removeMagazine "4Rnd_GBU12";
		_this addWeapon "MaverickLauncher";
		_this addMagazine "2Rnd_Maverick_A10";
		_this addMagazine "2Rnd_Maverick_A10";
	};
	case "BRDM2_ATGM_TK_EP1":
     {
        _this removeMagazines "5Rnd_AT5_BRDM2";
        _this removeWeapon "AT5Launcher";
        _this  addMagazine "2Rnd_Igla";
        _this addMagazine "2Rnd_Igla";
        _this addMagazine "2Rnd_Igla";
        _this addMagazine "2Rnd_Igla";
        _this addMagazine "2Rnd_Igla";
        _this addWeapon "Igla_twice";
      }; 
	case "M1135_ATGMV_EP1":
       {
        _this removeWeapon "TOWLauncher";
        _this removeMagazines "2Rnd_TOW";
        _this addMagazine "6Rnd_TOW_HMMWV";
        _this addMagazine "6Rnd_TOW_HMMWV";
		 _this addWeapon "TOWLauncherSingle";
    }; 
	case "AH64D_EP1": {
		_this addMagazine "2Rnd_Sidewinder_AH1Z";
		_this addWeapon "SidewinderLaucher_AH1Z";
		_this removeWeapon "M230";
		_this removeMagazine "1200Rnd_30x113mm_M789_HEDP";
		_this addMagazine "750Rnd_M197_AH1";
		_this addWeapon "M197";
	};
	case "A10_US_EP1": {
//		_this removeWeapon "GAU8";
//		_this removeMagazine "1350Rnd_30mmAP_A10";
		_this removeWeapon "BombLauncherA10";
		_this removeMagazine "4Rnd_GBU12";
		_this removeWeapon "MaverickLauncher";
		_this removeMagazine "2Rnd_Maverick_A10";
		_this removeWeapon "SidewinderLaucher_AH1Z";
		_this removeMagazine "2Rnd_Sidewinder_AH1Z";
//		_this addWeapon "GAU12";
//		_this addMagazine "300Rnd_25mm_GAU12";
		_this addWeapon "Mk82BombLauncher_6";
		_this addMagazine "6Rnd_Mk82";		
		_this addMagazine "2Rnd_Sidewinder_AH1Z";
		_this addWeapon "SidewinderLaucher_AH1Z";
	};
	case "AV8B2": {
		_this removeWeapon "SidewinderLaucher_AH1Z";
		_this removeMagazine "2Rnd_Sidewinder_AH1Z";
		_this addMagazine "4Rnd_Sidewinder_AV8B";
		_this addWeapon "SidewinderLaucher";
		
	};
	case "An2_1_TK_CIV_EP1": {
		_this addMagazine "500Rnd_TwinVickers";
		_this addMagazine "500Rnd_TwinVickers";
		_this addWeapon "TwinVickers";
		_this addMagazine "60Rnd_CMFlareMagazine";
		_this addWeapon "CMFlareLauncher";
		};
	case "Mi17_medevac_RU": {
	    _this addMagazine "60Rnd_CMFlareMagazine";
		_this addWeapon "CMFlareLauncher";
	};
	case "An2_2_TK_CIV_EP1": {
		_this addMagazine "500Rnd_TwinVickers";
		_this addMagazine "500Rnd_TwinVickers";
		_this addWeapon "TwinVickers";
		_this addMagazine "60Rnd_CMFlareMagazine";
		_this addWeapon "CMFlareLauncher";
	};
	case "Mi24_D_TK_EP1": {
		_this removeWeapon "AT2Launcher";
		_this addWeapon "AT6Launcher";
		_this addMagazine "4Rnd_AT6_Mi24V";
		
	};
	case "Mi24_V": {
		_this removeWeapon "AT6Launcher";
		_this removeWeapon "YakB";
		_this removeMagazine "80Rnd_80mm";
		_this addWeapon "AT9Launcher";
		_this addWeapon "GSh23L";
		_this addWeapon "R73Launcher_2";
		_this addMagazine "40Rnd_80mm";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "2Rnd_R73";
		_this addMagazine "520Rnd_23mm_GSh23L";
	};
	case "UH1Y": {
		_this addMagazineTurret ["14Rnd_FFAR",[-1]];	
		_this addMagazineTurret ["14Rnd_FFAR",[-1]];
	};
	case "An2_TK_EP1": {
		_this addMagazine "500Rnd_TwinVickers";
		_this addMagazine "500Rnd_TwinVickers";
		_this addWeapon "TwinVickers";
		_this addMagazine "60Rnd_CMFlareMagazine";
		_this addWeapon "CMFlareLauncher";
	};
	case "Su34": {
		_this removeWeapon  "Ch29Launcher_Su34";
		_this removeMagazine "6Rnd_Ch29";
		_this addMagazine "4Rnd_FAB_250";				
		_this addMagazine "4Rnd_FAB_250";
		_this addWeapon "AirBombLauncher";
	    _this removeWeapon  "GSh301";
	    _this removeMagazine "180Rnd_30mm_GSh301";
	    _this addMagazine "750Rnd_30mm_GSh301";
	    _this addWeapon "GSh302";
	    
	   
	};
		case "Su39": {
		_this removeWeapon "GSh301";
		_this removeMagazine "180Rnd_30mm_GSh301";
		_this addWeapon "AZP85";
		_this addMagazine "2000Rnd_23mm_AZP85";
		_this removeMagazine "80Rnd_S8T";
		_this addMagazine "40Rnd_S8T";
		
	};	
	case "Su25_TK_EP1": {
		_this removeWeapon "GSh301";
		_this addWeapon "GSh302";
		_this addMagazine "750Rnd_30mm_GSh301";
	};
	case "Su25_Ins": {
		_this removeWeapon "GSh301";
		_this addWeapon "GSh302";
		_this addMagazine "750Rnd_30mm_GSh301";
	};

	case "Ka52": {
		_this removeWeapon "VikhrLauncher";
		_this removeMagazine "12Rnd_Vikhr_KA50";
		_this addWeapon "AT9Launcher";
		_this addWeapon "R73Launcher_2";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "2Rnd_R73";
		_this addMagazine "2Rnd_R73";
	};	
	
	case "Ka52Black": {
		_this removeWeapon "VikhrLauncher";
		_this removeMagazine "12Rnd_Vikhr_KA50";
		_this addWeapon "AT9Launcher";
		_this addWeapon "R73Launcher_2";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "2Rnd_R73";
	};
	
	case "BAF_Apache_AH1_D": {
				
		_this addMagazine "4Rnd_Sidewinder_AV8B";
		_this addWeapon "SidewinderLaucher";
		_this addWeapon "MaverickLauncher";
		_this addMagazine "2Rnd_Maverick_A10";
		
	};
	
	case "L39_TK_EP1": {
		_this addMagazine "2Rnd_R73";
		_this addWeapon "R73Launcher_2";
		
//		_this addMagazine "60Rnd_CMFlareMagazine";
//		_this addWeapon "CMFlareLauncher";
//		_this removeMagazine "64Rnd_57mm";
//		_this addMagazine "14Rnd_57mm";
				
		_this removeWeapon "GSh23L_L39";
	    _this removeMagazine "150Rnd_23mm_GSh23L";
	    _this addMagazine "180Rnd_30mm_GSh301";
		_this addWeapon "GSh301";
	
	};
	
	case "C130J_US_EP1": {
	_this addWeapon "CTWS";
//	_this addMagazine "200Rnd_40mmHE_FV510";
	_this addMagazine "200Rnd_40mmSABOT_FV510";
	_this removeWeapon "CMFlareLauncher";
	_this removeMagazine "120Rnd_CMFlare_Chaff_Magazine";	

	
	};
	case "Igla_AA_pod_TK_EP1":
{
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeweapon "Igla_twice";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addWeapon "StingerLauncher_twice";
};

case "Igla_AA_pod_East":
{
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeMagazine "2Rnd_Igla";
_this removeweapon "Igla_twice";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addmagazine "2Rnd_Stinger";
_this addWeapon "StingerLauncher_twice";
};
	
	
	};