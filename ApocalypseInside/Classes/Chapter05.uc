//=============================================================================
// Chapter05.
//=============================================================================
class Chapter05 expands CNNBaseIngameCutscene;

function Timer() {

	Super.Timer();
	SendPlayerOnceToGame();
	
	if (Player.IsInState('Dying'))
		{
			Player.drugEffectTimer += 60.0;
			Level.Game.SendPlayer(Player, "AvatarServer?Difficulty="$Player.combatDifficulty);
			player.HealPlayer(100, False);
		}
}

	function CheckIntroFlags()
	{
	if (flags.GetBool('IntroInsidePlayed'))
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

function StartConversationWithActor()
{
	if (!flags.GetBool('IntroInsidePlayed'))
	{
	   	if (player != none)
		{
			DeusExRootWindow(player.rootWindow).ResetFlags();

			foreach AllActors(class'Actor', actorToSpeak, actorTag)
				break;

			if (actorToSpeak != none) {
				player.StartConversationByName(conversationName, actorToSpeak, false, true);
			}

			// turn down the sound so we can hear the speech
			savedSoundVolume = SoundVolume;
			SoundVolume = 32;
			player.SetInstantSoundVolume(SoundVolume);
		}
	}
}

function RestoreSoundVolume()
{
	if (flags.GetBool('IntroInsidePlayed') && !isIntroCompleted)
	{
		SoundVolume = savedSoundVolume;
		player.SetInstantSoundVolume(SoundVolume);
	}
}

function SendPlayerOnceToGame()
{
	if (flags.GetBool('IntroInsidePlayed') && !isIntroCompleted)
	{
		if (DeusExRootWindow(player.rootWindow) != none) {
			DeusExRootWindow(player.rootWindow).ClearWindowStack();
		}

		Level.Game.SendPlayer(player, sendToLocation);
	}
}
		
defaultproperties
{
    missionName="Moon"
	CamTag=''
	sendToLocation="Moon_V1#TwoMonthsLater"
	conversationName=IntroInside
	actorTag=Magdalene
}