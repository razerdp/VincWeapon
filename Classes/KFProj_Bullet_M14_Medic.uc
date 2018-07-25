class KFProj_Bullet_M14_Medic extends KFProj_Bullet
   hidedropdown;

defaultproperties
{
   MaxSpeed=30000.0
   Speed=30000.0

   DamageRadius=0


   ImpactEffects=none
   // wep_railgun_emit.FX_Railgun_Projectile_01
   ProjFlightTemplate=ParticleSystem'wep_railgun_emit.FX_Railgun_Projectile_01'
   // ProjFlightTemplate=ParticleSystem'WEP_Static_Strikers_EMIT.FX_Static_Strikers_Bash_01'
}