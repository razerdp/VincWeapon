//=============================================================================
// KFDT_Ballistic_Hemogoblin
//=============================================================================
// Damage type for Hemogoblin. Handles spawning of the local client actor for
//      the tube inserted into the enemy, as well as the underlying dot damage
//      associated with the bleed effect.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_M14_Medic extends KFDT_Ballistic_Shell
    abstract
    hidedropdown;

//Visual class to attach to the victim when impact occurs
var class<Actor> TubeAttachClass;

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

/**
* Allows the damage type to customize exactly which hit zones it can dismember while the zed is alive
*/
static simulated function bool CanDismemberHitZoneWhileAlive(name InHitZoneName)
{
    return false;
}

static function PlayImpactHitEffects(KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
    local Actor TubeAttachment;
    local Vector StickLocation;
    local Rotator StickRotation;
    local name BoneName;
    local WorldInfo WI;
    local KFPawn RetracePawn;
    local Vector RetraceLocation;
    local Vector RetraceNormal;
    local TraceHitInfo HitInfo;

    WI = class'WorldInfo'.static.GetWorldInfo();
    if (P != none && P.isA('KFPawn_Monster') && HitZoneIndex > 0 && HitZoneIndex < P.HitZones.Length && WI != none && WI.NetMode != NM_DedicatedServer)
    {
        //Don't play additional FX here if we aren't attaching a new tube, let its built in blood spray handle things
        //super.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);

        //Retrace to get valid hit normal
        foreach WI.TraceActors(class'KFPawn', RetracePawn, RetraceLocation, RetraceNormal, HitLocation + HitDirection * 50, HitLocation - HitDirection * 50, vect(0, 0, 0), HitInfo, 1) //TRACEFLAG_Bullet
        {
            if (P == RetracePawn)
            {
                HitLocation = RetraceLocation;
                HitDirection = -RetraceNormal;
                break;
            }
        }

        TubeAttachment = P.Spawn(default.TubeAttachClass, P, , HitLocation, Rotator(HitDirection));
        if (TubeAttachment != none)
        {
            BoneName = P.HitZones[HitZoneIndex].BoneName;
            P.Mesh.TransformToBoneSpace(BoneName, TubeAttachment.Location, TubeAttachment.Rotation, StickLocation, StickRotation);
            TubeAttachment.SetBase(P, , P.Mesh, BoneName);
            TubeAttachment.SetRelativeLocation(StickLocation);
            TubeAttachment.SetRelativeRotation(StickRotation);
        }
    }
    
}

static function ApplySecondaryDamage( KFPawn Victim, int DamageTaken, optional Controller InstigatedBy )
{
    local class<KFDamageType> ToxicDT;
	local int ToxicDamageTaken;

	ToxicDamageTaken = DamageTaken;
    ToxicDT = class'KFDT_Ballistic_Assault_Medic'.static.GetMedicToxicDmgType( ToxicDamageTaken, InstigatedBy );
    if ( ToxicDT != None )
    {
        Victim.ApplyDamageOverTime(ToxicDamageTaken, InstigatedBy, ToxicDT);
    }

    Super(KFDamageType).ApplySecondaryDamage(Victim, DamageTaken, InstigatedBy);
}

defaultproperties
{
    KDamageImpulse=0
    KDeathUpKick=0
    KDeathVel=0

    KnockdownPower=0
    StunPower=0
    StumblePower=200
    GunHitPower=0
    MeleeHitPower=0
    BleedPower=75

    DoT_Type=DOT_Bleeding
    DoT_Duration=5.0 //10
    DoT_Interval=1.0 //1.0
    DoT_DamageScale=0.15 //0.5
	bStackDoT=true

    WeaponDef=class'VincWeapon.KFWeapDef_M14_Medic'
    ModifierPerkList(0)=class'KFPerk_FieldMedic'

    TubeAttachClass=class'KFWeapActor_Hemogoblin_Tube'
}
