//=============================================================================
// KFWeap_Shotgun_AA12
//=============================================================================
// AA12 Auto Shotgun Weapon Class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFWeap_Shotgun_AA12_DragonsFire extends KFWeap_ShotgunBase;

reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	Super.ClientWeaponSet(bOptionalSet, bDoNotActivate);

	class'VincUtil'.static.SetFirstPersonWeaponSkin(self,6177);
}

simulated function AttachWeaponTo( SkeletalMeshComponent MeshCpnt, optional Name SocketName )
{

	super.AttachWeaponTo(MeshCpnt, SocketName);

	class'VincUtil'.static.SetThirdWeaponSkin(KFPawn(Instigator),6177);
}

// /** Returns an anim rate scale for reloading */
// simulated function float GetReloadRateScale()
// {

// 	local float result;

// 	result = super.GetReloadRateScale();

// 	return result*0.8;
// }

defaultproperties
{
	// Inventory
	InventorySize=10
	GroupPriority=100
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AA12'

	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

     // FOV
 	MeshFOV=86
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=85
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=15.0,Y=8.5,Z=0.0)
	IronSightPosition=(X=8,Y=0,Z=0)

	// Content
	PackageKey="AA12"
	FirstPersonMeshName="Wep_1P_AA12_MESH.Wep_1stP_AA12_Rig"
	FirstPersonAnimSetNames(0)="Wep_1P_AA12_ANIM.Wep_1stP_AA12_Anim"
	PickupMeshName="WEP_3P_AA12_MESH.Wep_AA12_Pickup"
	AttachmentArchetypeName="WEP_AA12_ARCH.Wep_AA12_3P"
	MuzzleFlashTemplateName="WEP_AA12_ARCH.Wep_AA12_MuzzleFlash"

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AA12_DragonsFire'
	InstantHitDamage(DEFAULT_FIREMODE)=15.0 //25 //20
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_DragonsFire'
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	FireInterval(DEFAULT_FIREMODE)=0.25 // 300 RPM
	FireOffset=(X=30,Y=5,Z=-4)
	Spread(DEFAULT_FIREMODE)=0.08
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=8

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AA12_DragonsFire'
	InstantHitDamage(ALTFIRE_FIREMODE)=15.0 //25 //20
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_DragonsFire'
	PenetrationPower(ALTFIRE_FIREMODE)=2.0
	FireInterval(ALTFIRE_FIREMODE)=0.25 // 300 RPM
	Spread(ALTFIRE_FIREMODE)=0.06


	// Shotgun
	NumPellets(ALTFIRE_FIREMODE)=8


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_AA12Shotgun'
	InstantHitDamage(BASH_FIREMODE)=145

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_1P')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_1P')

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Ammo
	MagazineCapacity[0]=20
	SpareAmmoCapacity[0]=120 //120
	InitialSpareMags[0]=1
	bCanBeReloaded=true
	bReloadFromMagazine=true
	bHasFireLastAnims=false

	// Recoil
	maxRecoilPitch=80
	minRecoilPitch=90
	maxRecoilYaw=55
	minRecoilYaw=-55
	RecoilRate=0.025
	RecoilBlendOutRatio=0.25
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.7
	FallingRecoilModifier=1.5
	HippedRecoilModifier=1.75
    
	AssociatedPerkClasses(0)=class'KFPerk_Firebug'
	AssociatedPerkClasses(1)=class'KFPerk_Support'


	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'

	// Weapon Upgrade stat boosts
	WeaponUpgrades[1]=(IncrementDamage=1.15f,IncrementWeight=1)
}
