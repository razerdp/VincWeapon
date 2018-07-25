//m16 medic
class KFWeap_M14_Medic extends KFWeap_Rifle_M14EBR;

var(Healing) int		HealAmount;
var	class<DamageType>   HealingDartDamageType;
var AKEvent	HealImpactSoundPlayEvent;
var AKEvent HurtImpactSoundPlayEvent;

simulated function ProcessInstantHitEx( byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum )
{
    local KFPawn HealTarget;
    local KFPlayerController Healer;
	local KFPerk InstigatorPerk;
	local float AdjustedHealAmount;

    HealTarget = KFPawn(Impact.HitActor);
    Healer = KFPlayerController(Instigator.Controller);

	InstigatorPerk = GetPerk();
	if( InstigatorPerk != none )
	{
		InstigatorPerk.UpdatePerkHeadShots( Impact, InstantHitDamageTypes[FiringMode], ImpactNum );
	}

	if ( HealTarget != none && WorldInfo.GRI.OnSameTeam(Instigator,HealTarget) )
	{
        // Let the accuracy system know that we hit someone
		if( Healer != none )
		{
            Healer.AddShotsHit(1);
		}

		AdjustedHealAmount = HealAmount * static.GetUpgradeHealMod(CurrentWeaponUpgradeIndex);
    	HealTarget.HealDamage(AdjustedHealAmount, Instigator.Controller, HealingDartDamageType);

        // Play a healed impact sound for the healee
        if( HealImpactSoundPlayEvent != None && HealTarget != None && !bSuppressSounds  )
    	{
    	    HealTarget.PlaySoundBase(HealImpactSoundPlayEvent, false, false,,Impact.HitLocation);
    	}
	}
	else
	{
        // Play a hurt impact sound for the hurt
        if( HurtImpactSoundPlayEvent != None && HealTarget != None && !bSuppressSounds  )
    	{
    	    HealTarget.PlaySoundBase(HurtImpactSoundPlayEvent, false, false,,Impact.HitLocation);
    	}
        Super.ProcessInstantHitEx(FiringMode, Impact, NumHits, out_PenetrationVal);
	}
}


reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	Super.ClientWeaponSet(bOptionalSet, bDoNotActivate);

	class'VincUtil'.static.SetFirstPersonWeaponSkin(self,6062);
}


defaultproperties
{

	HealAmount=30
	// Inventory / Grouping
	InventorySize=8
	GroupPriority=75
	WeaponSelectTexture=Texture2D'WEP_UI_M14EBR_TEX.UI_WeaponSelect_SM14-EBR'
   	AssociatedPerkClasses(0)=class'KFPerk_FieldMedic'

 	// 2D scene capture
	Begin Object Name=SceneCapture2DComponent0
	   TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
	   FieldOfView=12.5 // "2.0X" = 25.0(our real world FOV determinant)/2.0
	End Object

    ScopedSensitivityMod=8.0

	ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_M14EBR_MAT_TWO.WEP_1P_M14EBR_Scope_MAT'

    // FOV
    MeshFOV=70
	MeshIronSightFOV=27
    PlayerIronSightFOV=70

	// Depth of field
	DOF_BlendInSpeed=3.0	
	DOF_FG_FocalRadius=0//70
	DOF_FG_MaxNearBlurSize=3.5

	// Content
	PackageKey="M14EBR"
	FirstPersonMeshName="WEP_1P_M14EBR_MESH.WEP_1stP_M14_EBR"
	FirstPersonAnimSetNames(0)="WEP_1P_M14EBR_ANIM.Wep_1stP_M14_EBR_Anim"
	PickupMeshName="WEP_3P_M14EBR_MESH.Wep_M14EBR_Pickup"
	AttachmentArchetypeName="WEP_M14EBR_ARCH.Wep_M14EBR_3P"
	MuzzleFlashTemplateName="WEP_M14EBR_ARCH.Wep_M14EBR_MuzzleFlash"

	LaserSightTemplate=KFLaserSightAttachment'FX_LaserSight_ARCH.LaserSight_WithAttachment_1P'

	// Ammo
	MagazineCapacity[0]=12
	SpareAmmoCapacity[0]=108
	InitialSpareMags[0]=2
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Zooming/Position
	PlayerViewOffset=(X=15.0,Y=11.5,Z=-4)
	IronSightPosition=(X=0.0,Y=0,Z=0)

	// AI warning system
	bWarnAIWhenAiming=true
	AimWarningDelay=(X=0.4f, Y=0.8f)
	AimWarningCooldown=0.0f

	// Recoil
	maxRecoilPitch=30
	minRecoilPitch=10
	maxRecoilYaw=30
	minRecoilYaw=-30
	RecoilRate=0.06
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=150
	RecoilISMinYawLimit=65385
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.2

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_M14EBR'
	InstantHitDamage(DEFAULT_FIREMODE)=80.0 //90
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_M14_Medic'
	FireInterval(DEFAULT_FIREMODE)=0.3 //0.2
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	Spread(DEFAULT_FIREMODE)=0.006
	FireOffset=(X=30,Y=3.0,Z=-2.5)

	// ALT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_M14EBR'
	InstantHitDamage(BASH_FIREMODE)=27

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Fire_Single_S')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_EBR.Play_WEP_SA_EBR_Handling_DryFire'

	// Custom animations
	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false
	bHasLaserSight=true

	HealingDartDamageType=class'KFDT_Dart_Healing'
	HealImpactSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Heal'
	HurtImpactSoundPlayEvent=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_Hurt'
	
	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(IncrementDamage=1.2f,IncrementHeal=1.1f,IncrementWeight=1)
	WeaponUpgrades[2]=(IncrementDamage=1.4f,IncrementHeal=1.2f,IncrementWeight=2)
}