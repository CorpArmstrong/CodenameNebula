//=============================================================================
// TantalusDenton.uc
//=============================================================================
class TantalusDenton extends JCDentonMale;

var travel BioEnergyController bioc;

//var AiDataLinkPlay aidataLinkPlay;		

//var String playerBias;

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
	local flagbase flags;
	Super.TravelPostAccept();

	
	flags = flagbase;
	
   	switch(PlayerSkin)
	{
		case 0:
			flags.SetBool('Bias_Templar',True);
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
			flags.SetBool('Bias_Triad',True);
			MultiSkins[0] = Texture'ApocalypseInside.Skins.TantalusAsian';
			MultiSkins[1] = Texture'DeusExCharacters.Skins.JockTex2';
			MultiSkins[2] = Texture'DeusExCharacters.Skins.ThugMaleTex3';
			MultiSkins[3] = Texture'ApocalypseInside.Skins.TantalusFace';
			MultiSkins[4] = Texture'DeusExCharacters.Skins.PaulDentonTex1';
			MultiSkins[5] = Texture'DeusExItems.Skins.PinkMaskTex';
			MultiSkins[6] = Texture'DeusExCharacters.Skins.FramesTex4';
			//MultiSkins[7] = FireTexture'Effects.Fire.Spark_Electric'; //causes ucc to return error
		break;
		case 2:
			flags.SetBool('Bias_MJ12',True);
			Mesh=LodMesh'DeusExCharacters.GM_Suit';
			MultiSkins[0] = Texture'ApocalypseInside.Skins.TantalusBlack';
			MultiSkins[1] = Texture'DeusExCharacters.Skins.LowerClassMale2Tex2';
			MultiSkins[2] = Texture'DeusExItems.Skins.PinkMaskTex';
			MultiSkins[3] = Texture'DeusExCharacters.Skins.MIBTex1';
			MultiSkins[4] = Texture'DeusExCharacters.Skins.MIBTex1';
			MultiSkins[5] = Texture'DeusExCharacters.Skins.FramesTex4';
			MultiSkins[6] = FireTexture'Effects.Laser.LaserSpot2';
			MultiSkins[7] = Texture'DeusExItems.Skins.PinkMaskTex';
		break;
		case 3:
			flags.SetBool('Bias_NSF',True);
			Mesh=LodMesh'DeusExCharacters.GM_DressShirt';
			MultiSkins[0] = Texture'ApocalypseInside.Skins.TantalusGinger';
			MultiSkins[1] = Texture'DeusExItems.Skins.PinkMaskTex';
			MultiSkins[2] = Texture'DeusExItems.Skins.PinkMaskTex';
			MultiSkins[3] = Texture'DeusExCharacters.Skins.ThugMale3Tex2';
			MultiSkins[4] = Texture'DeusExItems.Skins.PinkMaskTex';
			MultiSkins[5] = Texture'ApocalypseInside.Skins.NSFJacket';
			MultiSkins[6] = Texture'DeusExCharacters.Skins.FramesTex4';
			//MultiSkins[7] = FireTexture'Effects.water.WaterDrop1';
		break;
		case 4:
			flags.SetBool('Bias_UNATCO',True);
			MultiSkins[0] = Texture'ApocalypseInside.Skins.TantalusGoatee';
			MultiSkins[1] = Texture'DeusExCharacters.Skins.SmugglerTex2';
			MultiSkins[2] = Texture'DeusExCharacters.Skins.ThugMale3Tex2';
			MultiSkins[3] = Texture'DeusExCharacters.Skins.JCDentonTex0';
			MultiSkins[4] = Texture'DeusExCharacters.Skins.JCDentonTex1';
			MultiSkins[5] = Texture'DeusExCharacters.Skins.SmugglerTex2';
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
	Level.Game.SendPlayer(Self, "nyctest");
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

//invokes new hud initially for infolinks. found how to do it on http://www.offtopicproductions.com/tacks/CustomInfolinkPortraits/GameReaction%20Forums%20-%20Custom%20InfoLink%20Portraits.htm

function Possess() 
{ 

local DeusExRootWindow root; 

Super.Possess(); 

root = DeusExRootWindow(rootWindow); 

root.hud.Destroy(); 
root.hud = DeusexHUD(root.NewChild(Class'ApocalypseInsideHUD'));

root.hud.UpdateSettings(Self); 
root.hud.SetWindowAlignments(HALIGN_Full,VALIGN_Full, 0, 0); 

} 

// ----------------------------------------------------------------------
// StartDataLinkTransmission()
//
// Locates and starts the DataLink passed in
// ----------------------------------------------------------------------

function Bool StartDataLinkTransmission(
	String datalinkName, 
	Optional DataLinkTrigger datalinkTrigger)
{
	local Conversation activeDataLink;
	local bool bDataLinkPlaySpawned;

	// Don't allow DataLinks to start if we're in PlayersOnly mode
	if ( Level.bPlayersOnly )
		return False;

	activeDataLink = GetActiveDataLink(datalinkName);

	if ( activeDataLink != None )
	{
		// Search to see if there's an active DataLinkPlay object 
		// before creating one

		if ( dataLinkPlay == None )
		{
			datalinkPlay = Spawn(class'AiDataLinkPlay');
			bDataLinkPlaySpawned = True;
		}

		// Call SetConversation(), which returns 
		if (datalinkPlay.SetConversation(activeDataLink))
		{
			datalinkPlay.SetTrigger(datalinkTrigger);

			if (datalinkPlay.StartConversation(Self))
			{
				return True;
			}
			else
			{
				// Datalink must already be playing, or in queue
				if (bDataLinkPlaySpawned)
				{
					datalinkPlay.Destroy();
					datalinkPlay = None;
				}
				
				return False;
			}
		}
		else
		{
			// Datalink must already be playing, or in queue
			if (bDataLinkPlaySpawned)
			{
				datalinkPlay.Destroy();
				datalinkPlay = None;
			}
			return False;
		}
	}
	else
	{
		return False;
	}
}

// ----------------------------------------------------------------------
// InitializeSubSystems()
// ----------------------------------------------------------------------

function InitializeSubSystems()
{
	// Spawn the BarkManager
	if (BarkManager == None)
		BarkManager = Spawn(class'BarkManager', Self);

	// Spawn the Color Manager
	CreateColorThemeManager();
    ThemeManager.SetOwner(self);

	// install the augmentation system if not found
	if (AugmentationSystem == None)
	{
		AugmentationSystem = Spawn(class'AiAugmentationManager', Self);
		AugmentationSystem.CreateAugmentations(Self);
		AugmentationSystem.AddDefaultAugmentations();        
        AugmentationSystem.SetOwner(Self);       
	}
	else
	{
		AugmentationSystem.SetPlayer(Self);
        AugmentationSystem.SetOwner(Self);
	}

	// install the skill system if not found
	if (SkillSystem == None)
	{
		SkillSystem = Spawn(class'SkillManager', Self);
		SkillSystem.CreateSkills(Self);
	}
	else
	{
		SkillSystem.SetPlayer(Self);
	}

   if ((Level.Netmode == NM_Standalone) || (!bBeltIsMPInventory))
   {
      // Give the player a keyring
      //CreateKeyRing();
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
    Tag="TantalusTag"
}
