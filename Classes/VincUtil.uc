//vinc工具类
class VincUtil extends Object ;

/** 
 * 设置武器皮肤
 */
static function SetFirstPersonWeaponSkin(Weapon mWeapon, int ItemId)
{
	local array<MaterialInterface> SkinMICs;

	if (mWeapon!=none && ItemId > 0 && mWeapon.WorldInfo.NetMode != NM_DedicatedServer )
	{
		SkinMICs = class'KFWeaponSkinList'.static.GetWeaponSkin(ItemId, WST_FirstPerson);
		if ( SkinMICs.Length > 0 )
		{
			mWeapon.Mesh.SetMaterial(0, SkinMICs[0]);
			mWeapon.Mesh.SetMaterial(1, SkinMICs[0]);
		}
	}
	
}

static simulated function SetThirdWeaponSkin(KFPawn KFP , int ItemId)
{
//	if (KFP!=none && KFP.WeaponAttachment!=None)
//	{
//		KFP.WeaponAttachment.SetWeaponSkin(ItemId);
//	}

}


DefaultProperties
{

}
