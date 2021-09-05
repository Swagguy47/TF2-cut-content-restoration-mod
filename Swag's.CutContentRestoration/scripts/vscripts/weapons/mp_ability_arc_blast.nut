global function OnWeaponPrimaryAttack_ability_arc_blast


var function OnWeaponPrimaryAttack_ability_arc_blast( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	entity ownerPlayer = weapon.GetWeaponOwner()
	
	Assert( IsValid( ownerPlayer) && ownerPlayer.IsPlayer() )
	
	if ( IsValid( ownerPlayer ) && ownerPlayer.IsPlayer() )
	{
		if ( ownerPlayer.GetCinematicEventFlags() & CE_FLAG_CLASSIC_MP_SPAWNING )
			return false

		if ( ownerPlayer.GetCinematicEventFlags() & CE_FLAG_INTRO )
			return false
	}

	float duration = weapon.GetWeaponSettingFloat( eWeaponVar.fire_duration )
	
	//Abilities here are based off the short description leftover in the strings: "Stun nearby enemies, cloak, and stim to get away."
	StimPlayer( ownerPlayer, duration )
	

	PlayerUsedOffhand( ownerPlayer, weapon )

#if SERVER
EnableCloak( ownerPlayer, duration+2.5 )
#if BATTLECHATTER_ENABLED
	TryPlayWeaponBattleChatterLine( ownerPlayer, weapon )
#endif //
#else //
	Rumble_Play( "rumble_stim_activate", {} )
#endif //

	return weapon.GetWeaponSettingInt( eWeaponVar.ammo_min_to_fire )
}
