//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_AA12_DragonsFire extends KFWeaponDefinition
	abstract;

static function string GetItemName()
{
   return "AA12-龙息";
}

static function string GetItemDescription()
{
   return "• 使用龙息弹种的AA12自动霰弹枪。\n• 在半自动模式下弹片的扩散更小。";
}

static function string GetItemLocalization(string KeyName)
{
   return "AA12-龙息";
}

DefaultProperties
{
	WeaponClassPath="VincWeapon.KFWeap_Shotgun_AA12_DragonsFire"

	BuyPrice=1500
	AmmoPricePerMag=86 //110 //82
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_AA12"

	EffectiveRange=30

	UpgradePrice[0]=1500
	UpgradeSellPrice[0]=1150
}
