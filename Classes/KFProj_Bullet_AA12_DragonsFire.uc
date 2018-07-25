//=============================================================================
// KFProj_Bullet_DragonsBreath
//=============================================================================
// Shotgun pellet class for the the Mossberg 500
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_AA12_DragonsFire extends KFProj_Bullet
	hidedropdown;


/** Last hit normal from Touch() or HitWall() */
var vector LastHitNormal;

var float GroundFireChance;


simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	LastHitNormal = HitNormal;
	Super.ProcessTouch(Other, HitLocation, HitNormal);
}

/**
* Explode this Projectile
*/
simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	LastHitNormal = HitNormal;
	Super.TriggerExplosion(HitLocation, HitNormal, HitActor);
}


simulated protected function StopSimulating()
{
	local vector FlameSpawnVel;

	if (Role == ROLE_Authority && Physics == PHYS_Falling && FRand() < GroundFireChance)
	{
		//SpawnGroundFire();
		FlameSpawnVel = 0.25f * CalculateResidualFlameVelocity(LastHitNormal, Normal(Velocity), VSize(Velocity));
		SpawnResidualFlame(class'KFProj_DragonsBreathSplash', Location + (LastHitNormal * 10.f), FlameSpawnVel);
	}

	super.StopSimulating();
}

defaultproperties
{
	GroundFireChance=0.1f
	Physics=PHYS_Falling

	MaxSpeed=7000.0
	Speed=7000.0
	TerminalVelocity=7000.0

	bWarnAIWhenFired=true

	DamageRadius=0
	GravityScale=0.35
	TossZ=0

	Begin Object Class=PointLightComponent Name=PointLight0
	    LightColor=(R=255,G=0,B=0,A=255)
		Brightness=1.5f
		Radius=500.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=False
		bCastPerObjectShadows=false
		bEnabled=true
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object
	ProjFlightLight=PointLight0

	ImpactEffects=KFImpactEffectInfo'WEP_DragonsBreath_ARCH.DragonsBreath_bullet_impact'
	ProjFlightTemplate=ParticleSystem'WEP_DragonsBreath_EMIT.Tracer.FX_DragonsBreath_Tracer'
	ProjFlightTemplateZedTime=ParticleSystem'WEP_DragonsBreath_EMIT.Tracer.FX_DragonsBreath_Tracer_ZEDTime'

    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_DragonsBreath.Play_SA_DragonsBreath_Projectile_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_DragonsBreath.Stop_SA_DragonsBreath_Projectile_Loop'
}

