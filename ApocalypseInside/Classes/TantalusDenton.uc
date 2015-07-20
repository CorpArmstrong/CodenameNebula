//=============================================================================
// TantalusDenton.uc
//=============================================================================
class TantalusDenton extends JCDentonMale;

event TravelPostAccept()
{
    Super.TravelPostAccept();

    //MultiSkins[0] = Texture'DeusExCharacters.Skins.NathanMadisonTex0';
//    MultiSkins[3] = Texture'DeusExCharacters.Skins.NathanMadisonTex0';
}

// ----------------------------------------------------------------------
// ShowMainMenu()
//
// overrides the original so we can use our custom burdenMenuMain
// ----------------------------------------------------------------------
/*
exec function ShowMainMenu()
{
	local DeusExRootWindow root;
	local DeusExLevelInfo info;
	local Mission80Endgame Script;
	//local Mission80 Script;

	if (bIgnoreNextShowMenu)
	{
		bIgnoreNextShowMenu = False;
		return;
	}

	info = GetLevelInfo();

	// Special case baby!
	//
	// If the Intro map is loaded and we get here, that means the player
	// pressed Escape and we want to either A) start a new game
	// or B) return to the dx.dx screen. Either way we're going to
	// abort the Intro by doing this.
	//
	// If this is one of the Endgames (which have a mission # of 99)
	// then we also want to call the Endgame's "FinishCinematic"
	// function

	// force the texture caches to flush
	ConsoleCommand("FLUSH");

	if ((info != None) && (info.MissionNumber == 98))
	{
		bIgnoreNextShowMenu = True;
		PostIntro();
	}
	else if ((info != None) && (info.MissionNumber == 99))
	{
		foreach AllActors(class'Mission80Endgame', Script)

			break;

		if (Script != None)
			///Removed! Script.FinishCinematic();
	}
	else
	{
		root = DeusExRootWindow(rootWindow);
		if (root != None)
			root.InvokeMenu(class'ApocalypseInside.ApocalypseInsideMenuMain');
			//root.InvokeMenu(class'MenuMain');
	}
}
*/

// ----------------------------------------------------------------------
// ShowMainMenu()
//
// overrides the original so we can use our custom burdenMenuMain
// ----------------------------------------------------------------------
exec function ShowMainMenu()
{
	local DeusExRootWindow root;
	local DeusExLevelInfo info;
	info = GetLevelInfo();

	root = DeusExRootWindow(rootWindow);
	if (root != None)
		root.InvokeMenu(class'ApocalypseInside.ApocalypseInsideMenuMain');
}
// ----------------------------------------------------------------------
// ShowIntro()
// ----------------------------------------------------------------------

function ShowIntro(optional bool bStartNewGame)
{
	if (DeusExRootWindow(rootWindow) != None)
		DeusExRootWindow(rootWindow).ClearWindowStack();

	bStartNewGameAfterIntro = bStartNewGame;

	// Make sure all augmentations are OFF before going into the intro
	AugmentationSystem.DeactivateAll();

	// Reset the player
	Level.Game.SendPlayer(Self, "NYC_supergraphic");
}

// ----------------------------------------------------------------------
// ShowCredits()
//
// allows us to use custom credits window
// ----------------------------------------------------------------------
/*
function ShowCredits(optional bool bLoadIntro)
{
	local DeusExRootWindow root;
	local burdenCreditsWindow winCredits;

	root = DeusExRootWindow(rootWindow);

	if (root != None)
	{
		// Show the credits screen and force the game not to pause
		// if we're showing the credits after the endgame
		winCredits = burdenCreditsWindow(root.InvokeMenuScreen(Class'burdenCreditsWindow', bLoadIntro));
		winCredits.SetLoadIntro(bLoadIntro);
	}
}
*/


defaultproperties
{
    TruePlayerName="Tantalus Denton"
    Credits=0
    strStartMap="Area51"
    CarcassType=Class'JCDentonMaleCarcass'
    Mesh=LodMesh'DeusExCharacters.GM_Trench'
    MultiSkins(0)=Texture'DeusExCharacters.Skins.NathanMadisonTex0'
    MultiSkins(1)=Texture'DeusExItems.Skins.PinkMaskTex'
    MultiSkins(2)=Texture'DeusExItems.Skins.PinkMaskTex'
    MultiSkins(3)=Texture'DeusExCharacters.Skins.PantsTex5'
    MultiSkins(4)=Texture'DeusExCharacters.Skins.ThugMale2Tex0'
    MultiSkins(5)=Texture'PeterShirt'
    MultiSkins(6)=Texture'DeusExItems.Skins.GrayMaskTex'
    MultiSkins(7)=Texture'DeusExItems.Skins.BlackMaskTex'
    FamiliarName="Tantalus"
    UnfamiliarName="Tantalus Denton"
}