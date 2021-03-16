// Prodavec: fix BIS_Effects_AirDestructionStage2 function
// -------------------------------------------------------
BIS_Effects_Init = true; // Workaround. Shitty but it works :)

BIS_Effects_EH_Fired=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\fired.sqf";
BIS_Effects_EH_Killed=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\killed.sqf";

BIS_Effects_Rifle=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\rifle.sqf";
BIS_Effects_Cannon=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\cannon.sqf";
BIS_Effects_HeavyCaliber=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\heavycaliber.sqf";
BIS_Effects_HeavySniper=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\heavysniper.sqf";
BIS_Effects_Rocket=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\rocket.sqf";
BIS_Effects_SmokeShell=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\smokeshell.sqf";
BIS_Effects_SmokeLauncher=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\smokelauncher.sqf";
BIS_Effects_Flares=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\muzzle\flares.sqf";

//must use spawn command for these:
BIS_Effects_Burn=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
BIS_Effects_AircraftVapour=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\misc\aircraftvapour.sqf";
BIS_Effects_AirDestruction=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\destruction\AirDestruction.sqf";
// Fix is here
BIS_Effects_AirDestructionStage2=compile preprocessFileLineNumbers "Common\airdestructionstage2_fixed.sqf";
BIS_Effects_Secondaries=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\destruction\Secondaries.sqf";
// -------------------------------------------------------