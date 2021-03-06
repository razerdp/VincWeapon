class KFWeapDef_Throw_Thermite extends KFWeaponDefinition
	abstract;

static function string GetItemName()
{
   return "铝热剂";
}

static function string GetItemDescription()
{
   return "• 开火来投掷你的遥控铝热剂。\n• 辅助射击来依次点燃你放置的铝热剂。\n• 一组密集填充、可遥控点燃的铝热剂，可以将附着的目标烧成灰烬。";
}

static function string GetItemLocalization(string KeyName)
{
   return "铝热剂";
}

defaultproperties
{
   WeaponClassPath="VincWeapon.KFWeap_Throw_Thermite"
   // WEP_UI_Molotov_TEX.UI_WeaponSelect_MolotovCocktail
   ImagePath="wep_ui_dynamite_tex.UI_WeaponSelect_Dynamite"

   BuyPrice=950
   AmmoPricePerMag=35

   // UpgradePrice(0)=700
   // UpgradePrice(1)=1500
   // UpgradeSellPrice(0)=1425
   // UpgradeSellPrice(1)=2025

   EffectiveRange=5
}