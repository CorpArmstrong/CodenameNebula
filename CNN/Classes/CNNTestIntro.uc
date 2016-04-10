//-----------------------------------------------------------------------
// CNNTestIntro
//-----------------------------------------------------------------------
class CNNTestIntro expands MissionScript;

var byte savedSoundVolume;
var bool isIntroCompleted;

// ----------------------------------------------------------------------
// InitStateMachine()
// ----------------------------------------------------------------------

function InitStateMachine()
{
	Super.InitStateMachine();

	if (flags.GetBool('isIntroPlayed'))
	{
		// After we've teleported back and map has reloaded
		// set the flag, to skip recursive intro call.
		isIntroCompleted = true;
	}

	if (!isIntroCompleted)
	{
	    // Set the PlayerTraveling flag (always want it set for
		// the intro and endgames)
		flags.SetBool('PlayerTraveling', true, true, 0);
	}
}

// ----------------------------------------------------------------------
// FirstFrame()
//
// Stuff to check at first frame
// ----------------------------------------------------------------------

function FirstFrame()
{
	local RiotCop cop;
	Super.FirstFrame();

	if (!flags.GetBool('isIntroPlayed'))
	{
	   	if (player != None)
		{
			DeusExRootWindow(Player.rootWindow).ResetFlags();

			foreach AllActors(class'RiotCop', cop)
				break;

			if (cop != none) {
				player.StartConversationByName('CNNIntro', cop, false, true);
			}

			// turn down the sound so we can hear the speech
			savedSoundVolume = SoundVolume;
			SoundVolume = 32;
			Player.SetInstantSoundVolume(SoundVolume);
		}
	}
}

// ----------------------------------------------------------------------
// PreTravel()
//
// Set flags upon exit of a certain map
// ----------------------------------------------------------------------

function PreTravel()
{
	if (flags.GetBool('isIntroPlayed') && !isIntroCompleted)
	{
		// restore the sound volume
		SoundVolume = savedSoundVolume;
		Player.SetInstantSoundVolume(SoundVolume);
	}

	Super.PreTravel();
}

// ----------------------------------------------------------------------
// Timer()
//
// Main state machine for the mission
// ----------------------------------------------------------------------

function Timer()
{
	Super.Timer();

	if (flags.GetBool('isIntroPlayed') && !isIntroCompleted)
	{
		if (DeusExRootWindow(Player.rootWindow) != None) {
			DeusExRootWindow(Player.rootWindow).ClearWindowStack();
		}

		Level.Game.SendPlayer(player, "50_OpheliaL1_WithIntro#Loc1");
	}
}

defaultproperties
{
}
