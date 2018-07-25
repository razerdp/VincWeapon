//=============================================================================
// KFDT_Explosive_C4
//=============================================================================
// Explosive damage type for C4
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Brun_Explosive_Thermite extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=true
	EffectGroup=FXG_Fire

	// physics impact
	RadialDamageImpulse=2000//3000
	GibImpulseScale=0.15
	KDeathUpKick=1000
	KDeathVel=300

	KnockdownPower=150
	StumblePower=400
	BurnPower=2

	// DOT
	DoT_Type=DOT_Fire
	DoT_Duration=3.0
	DoT_Interval=1.0
	DoT_DamageScale=0.0 // don't want it to do any actual damage, because dying from DOT or taking DOT after death will cause obliteration, which looks weird

	WeaponDef=class'KFWeapDef_Throw_Thermite'
	ModifierPerkList(0)=class'KFPerk_Firebug'

	ObliterationHealthThreshold=-400
	ObliterationDamageThreshold=400
}
