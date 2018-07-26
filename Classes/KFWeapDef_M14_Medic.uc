class KFWeapDef_M14_Medic extends KFWeaponDefinition
	abstract;

static function string GetItemName()
{
   return "HMTECH-014";
}

static function string GetItemDescription()
{
   return "• M14的医疗改进型，能够发射伤害性和治疗性兼具的医疗针弹。";
}

static function string GetItemLocalization(string KeyName)
{
   return "HMTECH-014";
}

defaultproperties
{
   WeaponClassPath="VincWeapon.KFWeap_M14_Medic"
   ImagePath="WEP_UI_M14EBRAR_TEX.UI_WeaponSelect_M14EBRAR"
   BuyPrice=1100
   AmmoPricePerMag=36
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=1350
   UpgradeSellPrice(1)=2475
   EffectiveRange=90
}
