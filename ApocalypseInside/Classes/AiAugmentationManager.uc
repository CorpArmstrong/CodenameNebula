//=============================================================================
// AiAugmentationManager
//=============================================================================
class AiAugmentationManager extends AugmentationManager;

var Class<Augmentation> augClasses[25]; //was 25.  Can be increased as needed



defaultproperties
{
     AugLocs(0)=(NumSlots=1,KeyBase=4)
     AugLocs(1)=(NumSlots=1,KeyBase=7)
     AugLocs(2)=(NumSlots=3,KeyBase=8)
     AugLocs(3)=(NumSlots=1,KeyBase=5)
     AugLocs(4)=(NumSlots=1,KeyBase=6)
     AugLocs(5)=(NumSlots=2,KeyBase=2)
     AugLocs(6)=(NumSlots=3,KeyBase=11)
     augClasses(0)=Class'DeusEx.AugSpeed'
     augClasses(1)=Class'DeusEx.AugTarget'
     augClasses(2)=Class'DeusEx.AugCloak'
     augClasses(3)=Class'DeusEx.AugBallistic'
     augClasses(4)=Class'DeusEx.AugRadarTrans'
     augClasses(5)=Class'DeusEx.AugShield'
     augClasses(6)=Class'DeusEx.AugEnviro'
     augClasses(7)=Class'DeusEx.AugEMP'
     augClasses(8)=Class'DeusEx.AugCombat'
     augClasses(9)=Class'DeusEx.AugHealing'
     augClasses(10)=Class'DeusEx.AugStealth'
     augClasses(11)=Class'DeusEx.AugIFF'
     augClasses(12)=Class'DeusEx.AugLight'
     augClasses(13)=Class'DeusEx.AugMuscle'
     augClasses(14)=Class'DeusEx.AugVision'
     augClasses(15)=Class'DeusEx.AugDrone'
     augClasses(16)=Class'DeusEx.AugDefense'
     augClasses(17)=Class'DeusEx.AugAqualung'
     augClasses(18)=Class'DeusEx.AugDatalink'
     augClasses(19)=Class'DeusEx.AugHeartLung'
     augClasses(20)=Class'DeusEx.AugPower'
     augClasses(21)=Class'ApocalypseInside.AugIcarus'
     defaultAugs(0)=Class'DeusEx.AugLight'
     defaultAugs(1)=Class'DeusEx.AugIFF'
     defaultAugs(2)=Class'DeusEx.AugDatalink'
     AugLocationFull="You can't add any more augmentations to that location!"
     NoAugInSlot="There is no augmentation in that slot"
     //HighPowerDrain="High power drain detected"
     bHidden=True
     bTravel=True
}
