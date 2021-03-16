Private ["_ammo","_easaDefault","_easaLoadout","_easaVehi","_is_AAMissile","_loadout","_loadout_line","_vehicle"];

EASA_Equip = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_Equip.sqf';
EASA_RemoveLoadout = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_RemoveLoadout.sqf';

_easaDefault = [];
_easaLoadout = [];
_easaVehi = [];

/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */
_easaVehi = 	_easaVehi + ['Su25_TK_EP1'];
_easaDefault = 	_easaDefault + [[['AirBombLauncher','R73Launcher_2'],['4Rnd_FAB_250','2Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [5200,'R-73 (6)',[['R73Launcher_2'],['2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
  [5400,'R-73 (4) | FAB-250 (2)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_FAB_250']]],
  [5600,'R-73 (2) | FAB-250 (4)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','4Rnd_FAB_250']]],
  [5900,'FAB-250 (6)',[['AirBombLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250']]]
 ]
} else {
 [
  [5900,'FAB-250 (6)',[['AirBombLauncher','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [5100,'Ch-29 (6)',[['Ch29Launcher_Su34','6Rnd_Ch29']]],
  [5200,'Ch-29 (4) | FAB-250 (2)',[['Ch29Launcher_Su34','4Rnd_Ch29'],['AirBombLauncher','2Rnd_FAB_250']]],
  [5800,'Ch-29 (4) | R-73 (2)',[['Ch29Launcher_Su34','4Rnd_Ch29'],['R73Launcher_2','2Rnd_R73']]],
  [5700,'R-73 (6)',[['R73Launcher_2','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
  [5400,'R-73 (4) | FAB-250 (2)',[['R73Launcher','4Rnd_R73'],['AirBombLauncher','2Rnd_FAB_250']]],
  [5600,'R-73 (2) | FAB-250 (4)',[['R73Launcher_2','2Rnd_R73'],['AirBombLauncher','4Rnd_FAB_250']]]
 ]
}
];

_easaVehi = 	_easaVehi + ['Su25_Ins'];
_easaDefault = 	_easaDefault + [[['AirBombLauncher','R73Launcher_2'],['4Rnd_FAB_250','2Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
 [
  [5900,'FAB-250 (6)',[['AirBombLauncher','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [5100,'Ch-29 (6)',[['Ch29Launcher_Su34','6Rnd_Ch29']]],
  [5200,'Ch-29 (4) | FAB-250 (2)',[['Ch29Launcher_Su34','4Rnd_Ch29'],['AirBombLauncher','2Rnd_FAB_250']]],
  [5800,'Ch-29 (4) | R-73 (2)',[['Ch29Launcher_Su34','4Rnd_Ch29'],['R73Launcher_2','2Rnd_R73']]],
  [5700,'R-73 (6)',[['R73Launcher_2','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
  [5400,'R-73 (4) | FAB-250 (2)',[['R73Launcher','4Rnd_R73'],['AirBombLauncher','2Rnd_FAB_250']]],
  [5600,'R-73 (2) | FAB-250 (4)',[['R73Launcher_2','2Rnd_R73'],['AirBombLauncher','4Rnd_FAB_250']]]
 ]
];

_easaVehi = 	_easaVehi + ['Su39'];
_easaDefault = 	_easaDefault + [[['Ch29Launcher','R73Launcher_2'],['4Rnd_Ch29','2Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
 [
  [5900,'FAB-250 (6)',[['AirBombLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250']]],
  [5100,'Ch-29 (6)',[['Ch29Launcher_Su34'],['6Rnd_Ch29']]],
  [5200,'Ch-29 (4) | FAB-250 (2)',[['Ch29Launcher_Su34','AirBombLauncher'],['4Rnd_Ch29','2Rnd_FAB_250']]],
  [5800,'Ch-29 (4) | R-73 (2)',[['Ch29Launcher_Su34','R73Launcher_2'],['4Rnd_Ch29','2Rnd_R73']]],
  [5700,'R-73 (6)',[['R73Launcher_2'],['2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
  [5400,'R-73 (4) | FAB-250 (2)',[['R73Launcher','AirBombLauncher'],['4Rnd_R73','2Rnd_FAB_250']]],
  [5600,'R-73 (2) | FAB-250 (4)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','4Rnd_FAB_250']]]
 ]
];

_easaVehi = 	_easaVehi + ['Su34'];
_easaDefault = 	_easaDefault + [[['AirBombLauncher','R73Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
 [
  [5200,'FAB-250 (10)',[['AirBombLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [5950,'FAB-250 (8) | R-73 (2)',[['AirBombLauncher','R73Launcher_2'],['4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73']]],
  [5800,'FAB-250 (6) | R-73 (4)',[['AirBombLauncher','R73Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_R73']]],
  [5100,'FAB-250 (6) | Ch-29 (4)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_Ch29','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [5400,'FAB-250 (4) | Ch-29 (4) | R-73 (2)',[['AirBombLauncher','Ch29Launcher_Su34','R73Launcher_2'],['4Rnd_FAB_250','4Rnd_Ch29','2Rnd_R73']]],
  [5700,'FAB-250 (4) | R-73 (6)',[['AirBombLauncher','R73Launcher_2','R73Launcher'],['4Rnd_FAB_250','2Rnd_R73','4Rnd_R73']]],
  [5500,'FAB-250 (4) | Ch-29 (6)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','6Rnd_Ch29']]],
  [5400,'FAB-250 (2) | R-73 (8)',[['AirBombLauncher','R73Launcher'],['2Rnd_FAB_250','4Rnd_R73','4Rnd_R73']]],
  [5600,'FAB-250 (2) | R-73 (4) | Ch-29 (4)',[['AirBombLauncher','R73Launcher','Ch29Launcher_Su34'],['2Rnd_FAB_250','4Rnd_R73','4Rnd_Ch29']]],
  [5700,'FAB-250 (2) | R-73 (2) | Ch-29 (6)',[['AirBombLauncher','R73Launcher_2','Ch29Launcher_Su34'],['2Rnd_FAB_250','2Rnd_R73','6Rnd_Ch29']]],
  [5200,'R-73 (10)',[['R73Launcher','R73Launcher_2'],['4Rnd_R73','4Rnd_R73','2Rnd_R73']]],
  [7900,'Ch-29 (6) | R-73 (4)',[['Ch29Launcher_Su34','R73Launcher'],['6Rnd_Ch29','4Rnd_R73']]],
  [10500,'Ch-29 (10)',[['Ch29Launcher_Su34'],['6Rnd_Ch29','4Rnd_Ch29']]]
 ]
];

_easaVehi = 	_easaVehi + ['Mi24_P'];
_easaDefault = 	_easaDefault + [[['HeliBombLauncher'],['2Rnd_FAB_250']]];
_easaLoadout = 	_easaLoadout + [
 [
  [500,'FAB-250 (2)',[['HeliBombLauncher'],['2Rnd_FAB_250']]],
  [300,'R-73 (2)',[['R73Launcher_2'],['2Rnd_R73']]]
 ]
];

if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {
	_easaVehi = 	_easaVehi + ['Ka52'];
	_easaDefault = 	_easaDefault + [[['AT9Launcher','R73Launcher_2'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','2Rnd_R73','2Rnd_R73']]];
	_easaLoadout = 	_easaLoadout + [
	 [
	  [5150,'AT-9 (4) | R-73 (8)',[['AT9Launcher','R73Launcher_2'],['4Rnd_AT9_Mi24P','2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
	  [5150,'AT-9 (16) | R-73 (2)',[['AT9Launcher','R73Launcher_2'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','2Rnd_R73']]]
	 ]
	];

	_easaVehi = 	_easaVehi + ['Ka52Black'];
	_easaDefault = 	_easaDefault + [[['AT9Launcher','R73Launcher_2'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','2Rnd_R73']]];
	_easaLoadout = 	_easaLoadout + [
	 [
	  [5150,'AT-9 (4) | R-73 (8)',[['AT9Launcher','R73Launcher_2'],['4Rnd_AT9_Mi24P','2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
	  [5150,'AT-9 (16) | R-73 (2)',[['AT9Launcher','R73Launcher_2'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','2Rnd_R73']]]
	 ]
	];
};

_easaVehi = 	_easaVehi + ['F35B'];
_easaDefault = 	_easaDefault + [[['BombLauncherF35','SidewinderLaucher_F35'],['2Rnd_GBU12','2Rnd_Sidewinder_F35']]];
_easaLoadout = 	_easaLoadout + [
 [
  [1950,'GBU-12 (4)',[['BombLauncherA10'],['4Rnd_GBU12']]],
  [1500,'GBU-12 (2) | AIM-9L (2)',[['BombLauncherF35','SidewinderLaucher_F35'],['2Rnd_GBU12','2Rnd_Sidewinder_F35']]],
  [1750,'GBU-12 (2) | AGM-65 (2)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10']]],
  [5250,'AGM-65 (4)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [5200,'AIM-9L (4)',[['SidewinderLaucher'],['4Rnd_Sidewinder_AV8B']]]
 ]
];

_easaVehi = 	_easaVehi + ['AV8B'];
_easaDefault = 	_easaDefault + [[['BombLauncher'],['6Rnd_GBU12_AV8B']]];
_easaLoadout = 	_easaLoadout + [
 [
  [9600,'Mk82 (6)',[['Mk82BombLauncher_6'],['6Rnd_Mk82']]],
  [3500,'GBU-12 (6)',[['BombLauncher'],['6Rnd_GBU12_AV8B']]],
  [2900,'GBU-12 (4) | AIM-9L (2)',[['BombLauncherA10','SidewinderLaucher_AH1Z'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z']]],
  [3400,'GBU-12 (4) | AGM-65 (2)',[['BombLauncherA10','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10']]],
  [2700,'GBU-12 (2) | AIM-9L (4)',[['BombLauncherF35','SidewinderLaucher'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B']]],
  [3000,'GBU-12 (2) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
  [6200,'AIM-9L (6)',[['SidewinderLaucher','SidewinderLaucher_AH1Z'],['4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [5800,'AGM-65 (6)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]]
 ]
];

_easaVehi = 	_easaVehi + ['AV8B2'];
_easaDefault = 	_easaDefault + [[['BombLauncher','SidewinderLaucher_AH1Z'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
 [
  [4200,'GBU-12 (8)',[['BombLauncherA10'],['4Rnd_GBU12','4Rnd_GBU12']]],
  [4100,'GBU-12 (6) | AGM-65 (2)',[['BombLauncher','MaverickLauncher'],['6Rnd_GBU12_AV8B','2Rnd_Maverick_A10']]],
  [3800,'GBU-12 (6) | AIM-9L (2)',[['BombLauncher','SidewinderLaucher_AH1Z'],['6Rnd_GBU12_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [4300,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherA10','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3400,'GBU-12 (4) | AIM-9L (4)',[['BombLauncherA10','SidewinderLaucher'],['4Rnd_GBU12','4Rnd_Sidewinder_AV8B']]],
  [3600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherA10','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
  [3200,'GBU-12 (2) | AIM-9L (4) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher','MaverickLauncher'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B','2Rnd_Maverick_A10']]],
  [3500,'GBU-12 (2) | AIM-9L (2) | AGM-65 (4)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3100,'GBU-12 (2) | AIM-9L (6)',[['BombLauncherF35','SidewinderLaucher','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [3600,'GBU-12 (2) | AGM-65 (6)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [9900,'Mk82 (6) | AIM-9L (2)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z']]],
  [9400,'Mk82 (6) | AGM-65 (2)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10']]],
  [9550,'Mk82 (6) | GBU-12 (2)',[['Mk82BombLauncher_6','BombLauncherF35'],['6Rnd_Mk82','2Rnd_GBU12']]],
  [5600,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [5700,'AGM-65 (4) | AIM-9L (4)',[['MaverickLauncher','SidewinderLaucher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','4Rnd_Sidewinder_AV8B']]],
  [5900,'AGM-65 (6) | AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [5200,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [5100,'AIM-9L (8)',[['SidewinderLaucher_AH64'],['8Rnd_Sidewinder_AH64']]],
  [5300,'AIM-9L (6) | AGM-65 (2)',[['SidewinderLaucher','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]]
 ]
];

_easaVehi = 	_easaVehi + ['A10'];
_easaDefault = 	_easaDefault + [[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
 [
  [4200,'GBU-12 (8)',[['BombLauncherA10'],['4Rnd_GBU12','4Rnd_GBU12']]],
  [4100,'GBU-12 (6) | AGM-65 (2)',[['BombLauncher','MaverickLauncher'],['6Rnd_GBU12_AV8B','2Rnd_Maverick_A10']]],
  [3800,'GBU-12 (6) | AIM-9L (2)',[['BombLauncher','SidewinderLaucher_AH1Z'],['6Rnd_GBU12_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [4300,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherA10','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3400,'GBU-12 (4) | AIM-9L (4)',[['BombLauncherA10','SidewinderLaucher'],['4Rnd_GBU12','4Rnd_Sidewinder_AV8B']]],
  [3600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherA10','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
  [3200,'GBU-12 (2) | AIM-9L (4) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher','MaverickLauncher'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B','2Rnd_Maverick_A10']]],
  [3500,'GBU-12 (2) | AIM-9L (2) | AGM-65 (4)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3100,'GBU-12 (2) | AIM-9L (6)',[['BombLauncherF35','SidewinderLaucher','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [3600,'GBU-12 (2) | AGM-65 (6)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [9900,'Mk82 (6) | AIM-9L (2)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z']]],
  [9400,'Mk82 (6) | AGM-65 (2)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10']]],
  [9550,'Mk82 (6) | GBU-12 (2)',[['Mk82BombLauncher_6','BombLauncherF35'],['6Rnd_Mk82','2Rnd_GBU12']]],
  [5600,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [5700,'AGM-65 (4) | AIM-9L (4)',[['MaverickLauncher','SidewinderLaucher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','4Rnd_Sidewinder_AV8B']]],
  [5900,'AGM-65 (6) | AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [5200,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [5100,'AIM-9L (8)',[['SidewinderLaucher_AH64'],['8Rnd_Sidewinder_AH64']]],
  [5300,'AIM-9L (6) | AGM-65 (2)',[['SidewinderLaucher','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]]
 ]
];

_easaVehi = 	_easaVehi + ['A10_US_EP1'];
_easaDefault = 	_easaDefault + [[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [4200,'GBU-12 (8)',[['BombLauncherA10'],['4Rnd_GBU12','4Rnd_GBU12']]],
  [4300,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherA10','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3400,'GBU-12 (4) | AIM-9L (4)',[['BombLauncherA10','SidewinderLaucher_AH1Z'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [3600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherA10','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
  [5600,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [5700,'AGM-65 (4) | AIM-9L (4)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [5900,'AGM-65 (6) | AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [5200,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [5100,'AIM-9L (8)',[['SidewinderLaucher_AH1Z'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [5300,'AIM-9L (6) | AGM-65 (2)',[['SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]]
 ]
} else {
 [
  [4200,'GBU-12 (8)',[['BombLauncherA10'],['4Rnd_GBU12','4Rnd_GBU12']]],
  [4100,'GBU-12 (6) | AGM-65 (2)',[['BombLauncher','MaverickLauncher'],['6Rnd_GBU12_AV8B','2Rnd_Maverick_A10']]],
  [3800,'GBU-12 (6) | AIM-9L (2)',[['BombLauncher','SidewinderLaucher_AH1Z'],['6Rnd_GBU12_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [4300,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherA10','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3400,'GBU-12 (4) | AIM-9L (4)',[['BombLauncherA10','SidewinderLaucher'],['4Rnd_GBU12','4Rnd_Sidewinder_AV8B']]],
  [3600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherA10','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
  [3200,'GBU-12 (2) | AIM-9L (4) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher','MaverickLauncher'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B','2Rnd_Maverick_A10']]],
  [3500,'GBU-12 (2) | AIM-9L (2) | AGM-65 (4)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3100,'GBU-12 (2) | AIM-9L (6)',[['BombLauncherF35','SidewinderLaucher','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [3600,'GBU-12 (2) | AGM-65 (6)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3900,'Mk82 (6) | AIM-9L (2)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z']]],
  [9400,'Mk82 (6) | AGM-65 (2)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10']]],
  [4550,'Mk82 (6) | GBU-12 (2)',[['Mk82BombLauncher_6','BombLauncherF35'],['6Rnd_Mk82','2Rnd_GBU12']]],
  [5600,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [5700,'AGM-65 (4) | AIM-9L (4)',[['MaverickLauncher','SidewinderLaucher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','4Rnd_Sidewinder_AV8B']]],
  [5900,'AGM-65 (6) | AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [5200,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [5100,'AIM-9L (8)',[['SidewinderLaucher_AH64'],['8Rnd_Sidewinder_AH64']]],
  [5300,'AIM-9L (6) | AGM-65 (2)',[['SidewinderLaucher','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]]
 ]
}
];

_easaVehi = 	_easaVehi + ['AH64D_EP1'];
_easaDefault = 	_easaDefault + [[['HellfireLauncher','SidewinderLaucher_AH1Z'],['8Rnd_Hellfire','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [5900,'AGM-114 (8) | AIM-9L (4)',[['HellfireLauncher','SidewinderLaucher_AH1Z'],['8Rnd_Hellfire','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [5100,'AIM-9L (8)',[['SidewinderLaucher_AH1Z'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]]
 
 ]
} else {
 [
  [5900,'AGM-114 (8) | AIM-9L (4)',[['HellfireLauncher','SidewinderLaucher_AH1Z'],['8Rnd_Hellfire','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [5100,'AIM-9L (8)',[['SidewinderLaucher_AH64'],['8Rnd_Sidewinder_AH64']]]
  
 ]
}
];

_easaVehi = 	_easaVehi + ['AH1Z'];
_easaDefault = 	_easaDefault + [[['HellfireLauncher'],['8Rnd_Hellfire']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Vanilla) then {
 [
  [5900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [8100,'AIM-9L (8)',[['SidewinderLaucher_AH64'],['8Rnd_Sidewinder_AH64']]]
 ]
} else {
 [
  [5900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [8100,'AIM-9L (8)',[['SidewinderLaucher_AH1Z'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]]
 ]
}
];

//--- Now we check for AA-based loadouts.
for '_i' from 0 to count(_easaVehi)-1 do {
	_loadout = _easaLoadout select _i;
	
	for '_j' from 0 to count(_loadout)-1 do {
		_loadout_line = _loadout select _j;
		_is_AAMissile = false;
		
		//--- Browse each EASA magazines and check the ammunition kind.
		{
			_ammo = getText(configFile >> "CfgMagazines" >> _x >> "ammo"); //--- We grab the ammo used by the magazine.
			
			if (_ammo != "") then {
				//--- We check if the ammo is air-lock based and that in inherits from the missile class.
				if (getNumber(configFile >> "CfgAmmo" >> _ammo >> "airLock") == 1 && configName(inheritsFrom(configFile >> "CfgAmmo" >> _ammo)) == "MissileBase") exitWith {_is_AAMissile = true};
			};
		} forEach ((_loadout_line select 2) select 1);
		
		_loadout_line set [3, if (_is_AAMissile) then {true} else {false}];
	};
};


missionNamespace setVariable ['WFBE_EASA_Vehicles',_easaVehi];
missionNamespace setVariable ['WFBE_EASA_Loadouts',_easaLoadout];
missionNamespace setVariable ['WFBE_EASA_Default',_easaDefault];
