//-----------------------------------------------------------
//
//-----------------------------------------------------------
class CNNDoorSignalLight expands CageLight; // make CNNActor descendant

#exec Texture Import File=Textures\NotCageLightW.pcx Name=NCL_White Mips=On Flags=2
#exec Texture Import File=Textures\NotCageLightR.pcx Name=NCL_Red Mips=On Flags=2
#exec Texture Import File=Textures\NotCageLightG.pcx Name=NCL_Green Mips=On Flags=2

function BeginPlay()
{
// without super
}

function Trigger(Actor Other, Pawn Instigator)
{
	Skin=Texture'NCL_Green';
	//Super.Trigger(Other, Instigator);
}

function UnTrigger(Actor Other, Pawn Instigator)
{
	Skin=Texture'NCL_Red';
	//Super.UnTrigger(Other, Instigator);
}

DefaultProperties
{
	Skin=Texture'NCL_Red';
	ScaleGlow=2.0;
	bUnlit=True;
	LightType=LT_None;
	DrawScale=0.5;

	bCollideActors=false;
	bCollideWorld=false;
	bBlockActors=false;
	bBlockPlayers=false;
	bProjTarget=false;
}
