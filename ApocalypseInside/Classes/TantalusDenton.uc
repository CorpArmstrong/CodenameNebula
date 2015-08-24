//=============================================================================
// TantalusDenton.uc
//=============================================================================
class TantalusDenton extends JCDentonMale;

var travel BioEnergyController bioc;

// ----------------------------------------------------------------------
// PostBeginPlay()
//
// set up the augmentation and skill systems
// ----------------------------------------------------------------------

function PostBeginPlay() {
	bioc = Spawn(class'BioEnergyController', none);
	Super.PostBeginPlay();
}

event TravelPostAccept() {
	Super.TravelPostAccept();

   	switch(PlayerSkin)
	{
		case 0:
			MultiSkins[0] = Texture'ApocalypseInside.Skins.TantalusFace';
			MultiSkins[1] = Texture'DeusExCharacters.Skins.StantonDowdTex2';
			MultiSkins[2] = Texture'DeusExCharacters.Skins.MJ12TroopTex1';
			MultiSkins[3] = Texture'ApocalypseInside.Skins.TantalusFace';
			MultiSkins[4] = Texture'DeusExCharacters.Skins.JockTex1';
			MultiSkins[5] = Texture'DeusExCharacters.Skins.SmugglerTex2';
			MultiSkins[6] = Texture'DeusExCharacters.Skins.FramesTex4';
			MultiSkins[7] = FireTexture'Effects.Laser.LaserSpot2';
		break;
		case 1:
			MultiSkins[0] = Texture'ApocalypseInside.Skins.TantalusAsian';
			MultiSkins[1] = Texture'DeusExCharacters.Skins.TobyAtanweTex2';
			MultiSkins[2] = Texture'DeusExCharacters.Skins.GordonQuickTex3';
			MultiSkins[3] = Texture'ApocalypseInside.Skins.TantalusFace';
			MultiSkins[4] = Texture'DeusExCharacters.Skins.MaxChenTex1';
			MultiSkins[5] = Texture'DeusExCharacters.Skins.TobyAtanweTex2';
			MultiSkins[6] = Texture'DeusExCharacters.Skins.FramesTex4';
			//MultiSkins[7] = FireTexture'Effects.Fire.Spark_Electric'; //causes ucc to return error
		break;
		case 2:
			MultiSkins[0] = Texture'ApocalypseInside.Skins.TantalusBlack';
			MultiSkins[1] = Texture'DeusExCharacters.Skins.SmugglerTex2';
			MultiSkins[2] = Texture'DeusExCharacters.Skins.PantsTex5';
			MultiSkins[3] = Texture'ApocalypseInside.Skins.TantalusFace';
			MultiSkins[4] = Texture'DeusExCharacters.Skins.WaltonSimonsTex1';
			MultiSkins[5] = Texture'DeusExCharacters.Skins.SmugglerTex2';
			MultiSkins[6] = Texture'DeusExCharacters.Skins.FramesTex4';
			MultiSkins[7] = FireTexture'Effects.Laser.LaserSpot2';
		break;
		case 3:
			MultiSkins[0] = Texture'ApocalypseInside.Skins.TantalusGinger';
			MultiSkins[1] = Texture'ApocalypseInside.Skins.NSFJacket';
			MultiSkins[2] = Texture'DeusExCharacters.Skins.ThugMaleTex3';
			MultiSkins[3] = Texture'ApocalypseInside.Skins.TantalusFace';
			MultiSkins[4] = Texture'DeusExCharacters.Skins.JuanLebedevTex1';
			MultiSkins[5] = Texture'DeusExItems.Skins.PinkMaskTex';
			MultiSkins[6] = Texture'DeusExCharacters.Skins.FramesTex4';
			//MultiSkins[7] = FireTexture'Effects.water.WaterDrop1';
		break;
		case 4:
			MultiSkins[0] = Texture'ApocalypseInside.Skins.TantalusGoatee';
			MultiSkins[1] = Texture'DeusExCharacters.Skins.JosephManderleyTex2';
			MultiSkins[2] = Texture'DeusExCharacters.Skins.LowerClassMale2Tex2';
			MultiSkins[3] = Texture'ApocalypseInside.Skins.TantalusFace';
			MultiSkins[4] = Texture'DeusExCharacters.Skins.JCDentonTex1';
			MultiSkins[5] = Texture'DeusExCharacters.Skins.JosephManderleyTex2';
			MultiSkins[6] = Texture'DeusExCharacters.Skins.FramesTex4';
			MultiSkins[7] = FireTexture'Effects.Fire.SparkFX1';
		break;
	}
}

// ----------------------------------------------------------------------
// ShowMainMenu()
//
// overrides the original so we can use our custom ApocalypseInsideMenu.
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
	Level.Game.SendPlayer(Self, "OpheliaHotel");
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

// ----------------------------------------------------------------------
// UpdatePlayerSkin()
//
// overrides the original so we can use our custom skins
// ----------------------------------------------------------------------

function UpdatePlayerSkin()
{
	local PaulDenton paul;
	local PaulDentonCarcass paulCarcass;
	local JCDentonMaleCarcass jcCarcass;
	local JCDouble jc;

	// Paul Denton
	foreach AllActors(class'PaulDenton', paul)
		break;

	if (paul != None)
		paul.SetSkin(Self);

	// Paul Denton Carcass
	foreach AllActors(class'PaulDentonCarcass', paulCarcass)
		break;

	if (paulCarcass != None)
		paulCarcass.SetSkin(Self);

	// JC Denton Carcass
	foreach AllActors(class'JCDentonMaleCarcass', jcCarcass)
		break;

	if (jcCarcass != None)
		jcCarcass.SetSkin(Self);

	// JC's stunt double
	foreach AllActors(class'JCDouble', jc)
		break;

	if (jc != None)
		jc.SetSkin(Self);
}

function Destroyed() {
	if (bioc != none) {
		bioc.Destroy();
	}
}

defaultproperties
{
    TruePlayerName="Thomas D"
	BindName=Tantalus
    Credits=0
    strStartMap="01_Area51_Clones"
    CarcassType=Class'JCDentonMaleCarcass'
    Mesh=LodMesh'DeusExCharacters.GM_Trench'
    MultiSkins(0)=Texture'ApocalypseInside.Skins.TantalusFace'
    MultiSkins(1)=Texture'DeusExCharacters.Skins.StantonDowdTex2'
    MultiSkins(2)=Texture'DeusExCharacters.Skins.MJ12TroopTex1'
    MultiSkins(3)=Texture'ApocalypseInside.Skins.TantalusFace'
    MultiSkins(4)=Texture'DeusExCharacters.Skins.JockTex1'
    MultiSkins(5)=Texture'DeusExCharacters.Skins.SmugglerTex2'
    MultiSkins(6)=Texture'DeusExCharacters.Skins.FramesTex4'
    MultiSkins(7)=FireTexture'Effects.Laser.LaserSpot2'
    FamiliarName="Tantalus Denton"
    UnfamiliarName="Tantalus Denton"
    Tag="Asshole"
}
