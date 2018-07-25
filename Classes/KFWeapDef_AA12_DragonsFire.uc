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
   return "龙息AA12";
}

static function string GetItemDescription()
{
   return "• 附带火焰效果的AA12。\n• 单发模式下分散度更小。";
}

static function string GetItemLocalization(string KeyName)
{
   return "龙息AA12";
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
