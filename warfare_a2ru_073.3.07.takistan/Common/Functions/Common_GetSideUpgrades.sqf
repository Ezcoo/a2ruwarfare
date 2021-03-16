/*
	Return a side's HQ.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {WFBE_L_BLU getVariable "wfbe_upgrades"};
	case east: {WFBE_L_OPF getVariable "wfbe_upgrades"};
    // Prodavec: there're no upgrades on resistance on two side warfare
	//case resistance: {WFBE_L_GUE getVariable "wfbe_upgrades"};
	case resistance: {[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]};
	default {objNull};
}