//-----------------------------------------------------------
// CNNTestIntro
//-----------------------------------------------------------
class CNNTestIntro expands MissionScript;

var byte savedSoundVolume;

// ----------------------------------------------------------------------
// InitStateMachine()
// ----------------------------------------------------------------------

function InitStateMachine()
{
	Super.InitStateMachine();

	// Destroy all flags!
	//if (flags != None)
	//	flags.DeleteAllFlags();

	// Set the PlayerTraveling flag (always want it set for
	// the intro and endgames)
	flags.SetBool('PlayerTraveling', True, True, 0);
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
		// Make sure all the flags are deleted.
		DeusExRootWindow(Player.rootWindow).ResetFlags();

		foreach AllActors(class'RiotCop', cop)
			break;

		if (cop != none)
			player.StartConversationByName('CNNIntro', cop, False, True);

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
	// restore the sound volume
	SoundVolume = savedSoundVolume;
	Player.SetInstantSoundVolume(SoundVolume);

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

	// After the Intro conversation is over, tell the player to go on
	// to the next map (which will either be the main menu map or
	// the first game mission if we're starting a new game.

    //if (flags.GetBool('Intro_Played'))
	//{
	//	flags.SetBool('Intro_Played', False,, 1);
	//	player.PostIntro();
	//}

	if (flags.GetBool('isIntroPlayed'))
	{
		flags.SetBool('isIntroPlayed', False,, 1);

		// From player.PostIntro() code:
		//-------------------------------------------------------------
		if (DeusExRootWindow(Player.rootWindow) != None)
			DeusExRootWindow(Player.rootWindow).ClearWindowStack();

		// Set a flag designating that we're traveling,
		// so MissionScript can check and not call FirstFrame() for this map.
		flags.SetBool('PlayerTraveling', True, True, 0);
		//-------------------------------------------------------------

		Level.Game.SendPlayer(player, "50_OpheliaL1_WithIntro#Loc1");
	}
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
}
