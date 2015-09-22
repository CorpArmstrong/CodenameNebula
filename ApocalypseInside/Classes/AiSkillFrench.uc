//================================================================================
// AiSkillFrench.
//================================================================================

class AiSkillFrench extends Skill;


defaultproperties
{
    mpCost1=1000

    mpCost2=1000

    mpCost3=1000

    mpLevel0=1.00

    mpLevel1=1.00

    mpLevel2=2.00

    mpLevel3=3.00

    SkillName="French"

    Description="Practical knowledge of human physiology can be applied by an agent in the field allowing more efficient use of medkits.|n|nUNTRAINED: An agent can use medkits.|n|nTRAINED: An agent can heal slightly more damage and reduce the period of toxic poisoning.|n|nADVANCED: An agent can heal moderately more damage and further reduce the period of toxic poisoning.|n|nMASTER: An agent can perform a heart bypass with household materials."

    SkillIcon=Texture'DeusExUI.UserInterface.SkillIconMedicine'

    cost(0)=900

    cost(1)=1800

    cost(2)=3000

    LevelValues(0)=1.00

    LevelValues(1)=2.00

    LevelValues(2)=2.50

    LevelValues(3)=3.00

}