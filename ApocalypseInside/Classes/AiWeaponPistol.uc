//================================================================================
// AiWeaponPistol.
//================================================================================

class AiWeaponPistol extends DeusExWeapon;

simulated function PreBeginPlay ()
{
	Super.PreBeginPlay();
	if ( Level.NetMode != NM_StandAlone)
	{
		HitDamage = mpHitDamage;
		BaseAccuracy = mpBaseAccuracy;
		reloadTime = mpReloadTime;
		AccurateRange = mpAccurateRange;
		maxRange = mpMaxRange;
		ReloadCount = mpReloadCount;
	}
}

defaultproperties
{
    LowAmmoWaterMark=6

    GoverningSkill=Class'SkillWeaponPistol'

    EnviroEffective=1

    Concealability=1

    ShotTime=0.60

    reloadTime=2.00

    HitDamage=14

    maxRange=4800

    AccurateRange=2400

    BaseAccuracy=0.70

    bCanHaveScope=True

    ScopeFOV=25

    bCanHaveLaser=True

    recoilStrength=0.30

    mpReloadTime=2.00

    mpHitDamage=20

    mpBaseAccuracy=0.20

    mpAccurateRange=1200

    mpMaxRange=1200

    mpReloadCount=9

    bCanHaveModBaseAccuracy=True

    bCanHaveModReloadCount=True

    bCanHaveModAccurateRange=True

    bCanHaveModReloadTime=True

    bCanHaveModRecoilStrength=True

    AmmoName=Class'Ammo10mm'

    ReloadCount=6

    PickupAmmoCount=6

    bInstantHit=True

    FireOffset=(X=-22.00,Y=10.00,Z=14.00),

    shakemag=50.00

    FireSound=Sound'DeusExSounds.Weapons.PistolFire'

    CockingSound=Sound'DeusExSounds.Weapons.PistolReload'

    SelectSound=Sound'DeusExSounds.Weapons.PistolSelect'

    InventoryGroup=2

    ItemName="Pistol"

    PlayerViewOffset=(X=22.00,Y=-10.00,Z=-14.00),

    PlayerViewMesh=LodMesh'DeusExItems.Glock'

    PickupViewMesh=LodMesh'DeusExItems.GlockPickup'

    ThirdPersonMesh=LodMesh'DeusExItems.Glock3rd'

    Icon=Texture'DeusExUI.Icons.BeltIconPistol'

    largeIcon=Texture'DeusExUI.Icons.LargeIconPistol'

    largeIconWidth=46

    largeIconHeight=28

    Description="A standard 10mm pistol."

    beltDescription="PISTOL"

    Mesh=LodMesh'DeusExItems.GlockPickup'

    CollisionRadius=7.00

    CollisionHeight=1.00

}