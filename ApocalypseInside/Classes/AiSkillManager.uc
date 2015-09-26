//================================================================================
// AiSkillManager.
//================================================================================

class AiSkillManager extends SkillManager;


defaultproperties
{
    skillClasses(0)=Class'AiSkillPiloting'//was Heavy
	
	skillClasses(1)=Class'SkillWeaponPistol'

    skillClasses(2)=Class'AiSkillChinese'//wasRifle

    skillClasses(3)=Class'SkillWeaponLowTech'

    skillClasses(4)=Class'SkillDemolition'

    skillClasses(5)=Class'SkillEnviro'

    skillClasses(6)=Class'SkillLockpicking'

    skillClasses(7)=Class'SkillTech'

    skillClasses(8)=Class'AiSkillBionics' //was Medicine

    skillClasses(9)=Class'SkillComputer'

    skillClasses(10)=Class'SkillSwimming'

    NoToolMessage="You need the %s"

    NoSkillMessage="%s skill level insufficient to use the %s"

    SuccessMessage="Success!"

    YourSkillLevelAt="Your skill level at %s is now %d"

    bHidden=True

    bTravel=True

}