//=============================================================================
// AugIcarus.
//=============================================================================
class AugIcarus extends Augmentation;

var float mpAugValue;
var float mpEnergyDrain;

state Active
{
Begin:
	Player.SetPhysics(PHYS_Spider);
}

function Deactivate()
{
		Player.SetPhysics(PHYS_Falling);
}

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	// If this is a netgame, then override defaults
	if ( Level.NetMode != NM_StandAlone )
	{
		LevelValues[3] = mpAugValue;
		EnergyRate = mpEnergyDrain;
	}
}

defaultproperties
{
     mpEnergyDrain=20.000000
     EnergyRate=0.000000
     Icon=Texture'DeusExUI.UserInterface.AugIconRunSilent'
     smallIcon=Texture'DeusExUI.UserInterface.AugIconRunSilent_Small'
     AugmentationName="Run Silent"
     Description="The Icarus Landing System biomod lets you land safely after falling from any reasonable distance.|n|nTECH ONE: Sound made while moving is reduced slightly.|n|nTECH TWO: Sound made while moving is reduced moderately.|n|nTECH THREE: Sound made while moving is reduced significantly.|n|nTECH FOUR: An agent is completely silent."
     MPInfo="When active, you do not make footstep sounds.  Energy Drain: Low"
     LevelValues(0)=0.750000
     LevelValues(1)=0.500000
     LevelValues(2)=0.250000
     AugmentationLocation=LOC_Leg
     MPConflictSlot=8
}
