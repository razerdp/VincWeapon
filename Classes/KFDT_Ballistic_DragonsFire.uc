//=============================================================================
// KFDT_Ballistic_DragonsBreath
//=============================================================================
// Dragons breath damage type (mostly a copy of KFDT_Ballistic_Shotgun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Greg Felber 05/06/2015
//=============================================================================

class KFDT_Ballistic_DragonsFire extends KFDT_Ballistic_Shotgun
	abstract
	hidedropdown;

// Damage type to use for the burning damage over time
var class<KFDamageType> BurnDamageType;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	if( super.CanDismemberHitZone( InHitZoneName ) )
	{
		return true;
	}

	switch ( InHitZoneName )
	{
		case 'lupperarm':
		case 'rupperarm':
		case 'chest':
		case 'heart':
	 		return true;
	}

	return false;
}

/** Play damage type specific impact effects when taking damage */
static function PlayImpactHitEffects( KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator )
{
	// Play burn effect when dead
	if( P.bPlayedDeath && P.WorldInfo.TimeSeconds > P.TimeOfDeath )
	{
		default.BurnDamageType.static.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
		return;
	}

	super.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
}

/** Called when damage is dealt to apply additional damage type (e.g. Damage Over Time) */
static function ApplySecondaryDamage( KFPawn Victim, int DamageTaken, optional Controller InstigatedBy )
{	
	// Overriden to specific a different damage type to do the burn damage over
	// time. We do this so we don't get shotgun pellet impact sounds/fx during
	// the DOT burning.
    if ( default.BurnDamageType.default.DoT_Type != DOT_None )
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.BurnDamageType);
    }
}

defaultproperties
{
	DoT_Type=DOT_Fire
	DoT_Duration=2.0
	DoT_Interval=0.5
	DoT_DamageScale=1.0
	bIgnoreSelfInflictedScale=true

	KDamageImpulse=0
	EffectGroup=FXG_Fire
	GoreDamageGroup=DGT_Shotgun
	BurnPower=2.5

	BloodSpread=0.4
	BloodScale=0.6

	CameraLensEffectTemplate=class'KFCameraLensEmit_Fire'
	BurnDamageType=class'KFDT_Fire_DragonsBreathDoT'

	WeaponDef=class'VincWeapon.KFWeapDef_AA12_DragonsFire'
	ModifierPerkList(1)=class'KFPerk_Firebug'
}
