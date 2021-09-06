untyped

global function SwagWepCache

void function SwagWepCache()
{
	//--------------------------------------------
	//New Weapons
	//--------------------------------------------
	
	PrecacheWeapon( "melee_pilot_kunai" )
	PrecacheWeapon( "melee_pilot_sword_p" )
	PrecacheWeapon( "melee_titan_punch_bison" )
	PrecacheWeapon( "melee_titan_punch_bison_p" )
	PrecacheWeapon( "mp_weapon_flak_rifle" )
	PrecacheWeapon( "mp_weapon_fukuda_br" )
	
	//--------------------------------------------
	//Fixed Weapons
	//--------------------------------------------
	
	PrecacheWeapon( "mp_ability_burncardweapon" )			//FIX ME
	PrecacheWeapon( "weapon_cubemap" )						//FIX ME
	PrecacheWeapon( "mp_ability_turretweapon" )
	PrecacheWeapon( "proto_viewmodel_test" )
	PrecacheWeapon( "mp_ability_pathchooser" )			//WIP
	
	//--------------------------------------------
	//TODO
	//--------------------------------------------
	
	// PrecacheWeapon( "mp_weapon_arc_trap" )
	// PrecacheWeapon( "mp_weapon_mega_turret_s2s" )
	// PrecacheWeapon( "sp_weapon_swarm_rockets_s2s" )
	// PrecacheWeapon( "sp_weapon_viperbossrockets_s2s" )
	
	//--------------------------------------------
	//MODELS
	//--------------------------------------------
	
	PrecacheModel( $"models/Robots/turret_hitscan/turret_hitscan.mdl" )
	PrecacheModel( $"models/robots/turret_plasma/turret_plasma.mdl" )
	PrecacheModel( $"models/Robots/turret_rocket/turret_rocket.mdl" )
	PrecacheModel( $"models/dev/envballs.mdl" )
	
	//--------------------------------------------
	
	printt( "SwagWepCache: Weapons Precached" )
}