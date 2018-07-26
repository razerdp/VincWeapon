class KFDT_Throw_Thermite extends KFDT_Explosive
	abstract
	hidedropdown;

var class<KFDamageType> MicroWaveDamageType;

/** Play damage type specific impact effects when taking damage */
static function PlayImpactHitEffects( KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator )
{
	// Play burn effect when dead
	if( P.bPlayedDeath && P.WorldInfo.TimeSeconds > P.TimeOfDeath )
	{
		default.MicroWaveDamageType.static.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
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
    if ( default.MicroWaveDamageType.default.DoT_Type != DOT_None )
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.MicroWaveDamageType);
    }
}


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
	DoT_Interval=0.25
	DoT_DamageScale=0.0 // don't want it to do any actual damage, because dying from DOT or taking DOT after death will cause obliteration, which looks weird

	MicroWaveDamageType=class'KFDT_Throw_Thermite_MicroWave'

	WeaponDef=class'KFWeapDef_Throw_Thermite'
	ModifierPerkList(0)=class'KFPerk_Firebug'

	ObliterationHealthThreshold=-400
	ObliterationDamageThreshold=400
}
