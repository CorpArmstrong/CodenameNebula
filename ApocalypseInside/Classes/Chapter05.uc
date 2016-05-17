//=============================================================================
// Chapter05.
//=============================================================================
class Chapter05 expands CNNBaseIngameCutscene;

function Timer() {

	Super.Timer();
	//SendPlayerOnceToGame();
	
	if (Player.IsInState('Dying'))
		{
			Player.drugEffectTimer += 60.0;
			Level.Game.SendPlayer(Player, "AvatarServer?Difficulty="$Player.combatDifficulty);
			player.HealPlayer(100, False);
		}
	
}


		
defaultproperties
{
    missionName="Moon"
	sendToLocation="Moon_V1#TwoMonthsLater"
	conversationName=IntroInside
	actorTag=Magdalene
	CutsceneEndFlagName=IsIntroInsideEnded
}