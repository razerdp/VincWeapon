//铝热剂
class KFWeap_Throw_Thermite extends KFWeap_Thrown_C4
{

}

defaultproperties
{
	// start in detonate mode so that an attempt to detonate before any charges are thrown results in
	// the proper third-person anim
	CurrentFireMode=DETONATE_FIREMODE

	// Zooming/Position
	PlayerViewOffset=(X=6.0,Y=2,Z=-4)
	FireOffset=(X=25,Y=15)
	UpdateInterval=0.25f

	// Content
	PackageKey="C4"
	FirstPersonMeshName="Wep_1P_C4_MESH.Wep_1stP_C4_Rig"
	FirstPersonAnimSetNames(0)="Wep_1P_C4_ANIM.Wep_1P_C4_ANIM"
	PickupMeshName="WEP_3P_C4_MESH.Wep_C4_Pickup"
	AttachmentArchetypeName="WEP_C4_ARCH.Wep_C4_3P"

	ScreenUIClass=class'KFGFxWorld_C4Screen'

	// Anim
	FireAnim=C4_Throw
	FireLastAnim=C4_Throw_Last

	DetonateAnim=Detonate
	DetonateLastAnim=Detonate_Last

	// Ammo
	MagazineCapacity[0]=1
	SpareAmmoCapacity[0]=5
	InitialSpareMags[0]=1
	AmmoPickupScale[0]=1.0

	// THROW_FIREMODE
	FireInterval(THROW_FIREMODE)=0.25
	FireModeIconPaths(THROW_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
	WeaponProjectiles(THROW_FIREMODE)=class'KFProj_Throw_Thermite'

	// DETONATE_FIREMODE
	FiringStatesArray(DETONATE_FIREMODE)=WeaponDetonating
	WeaponFireTypes(DETONATE_FIREMODE)=EWFT_Custom
	AmmoCost(DETONATE_FIREMODE)=0

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_C4'
	InstantHitDamage(BASH_FIREMODE)=23

	// Inventory / Grouping
	InventoryGroup=IG_Primary
	GroupPriority=50
	WeaponSelectTexture=Texture2D'WEP_UI_C4_TEX.UI_WeaponSelect_C4'
	InventorySize=4

   	AssociatedPerkClasses(0)=class'KFPerk_Firebug'

   	DetonateAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_Handling_Detonate'
	DryFireAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_DryFire'

	// Weapon Upgrade stat boosts
	//WeaponUpgrades[1]=(IncrementDamage=1.05f,IncrementWeight=1)
	//WeaponUpgrades[2]=(IncrementDamage=1.1f,IncrementWeight=2)
	//WeaponUpgrades[3]=(IncrementDamage=1.15f,IncrementWeight=3)
}