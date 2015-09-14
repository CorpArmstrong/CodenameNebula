//=============================================================================
// AiHUDCompassDisplay
//=============================================================================
class AiHUDCompassDisplay expands HUDCompassDisplay;

var Color			colTickMarks;
var DeusExPlayer	player;
var Int				mapNorth;
var Float			UnitsPerPixel;
var Int				clipWidth;
var Int             clipWidthHalf;
var Int				tickWidth;

// Used in Tick()
var int             drawPos;
var int             wrapPos;
var int             lastPlayerYaw;

// Defaults
var Texture texBackground;
var Texture texBorder;
var Texture texTickBox;

// ----------------------------------------------------------------------
// InitWindow()
// ----------------------------------------------------------------------

event InitWindow()
{
	Super.InitWindow();

	Hide();

	player = DeusExPlayer(DeusExRootWindow(GetRootWindow()).parentPawn);

	SetSize(73, 256);

	clipWidthHalf = clipWidth / 2;

	CreateCompassWindow();
}

// ----------------------------------------------------------------------
// Tick()
//
// Used to update the position of the compass based on the
// direction the player is facing.
// ----------------------------------------------------------------------

event Tick(float deltaSeconds)
{
	// Only continue if we moved
	if (lastPlayerYaw != player.Rotation.Yaw)
	{
		lastPlayerYaw = player.Rotation.Yaw;

		// Based on the player's rotation and the map's True North, calculate
		// where to draw the tick marks and letters
		drawPos = clipWidthHalf - (((lastPlayerYaw - mapNorth) & 65535) / UnitsPerPixel);

		// We have two tickmark windows to compensate what happens with
		// the wrap condition.

		if ((drawPos > 0) && (drawPos < clipWidth))
			wrapPos = drawPos - tickWidth;
		else if (drawPos - tickWidth < (clipWidthHalf))
			wrapPos = drawPos + tickWidth;
		else
			wrapPos = 100;

	}
}

// ----------------------------------------------------------------------
// VisibilityChanged()
// ----------------------------------------------------------------------

event VisibilityChanged(bool bNewVisibility)
{
	// If we becames visible make sure we enable the tick event so 
	// the compass position is enabled.
	bTickEnabled = bNewVisibility;
}

// ----------------------------------------------------------------------
// PostDrawWindow()
// ----------------------------------------------------------------------

function PostDrawWindow(GC gc)
{
	PostDrawBackground(gc);
}

// ----------------------------------------------------------------------
// PostDrawBackground()
// ----------------------------------------------------------------------

function DrawBackground(GC gc)
{
	gc.SetStyle(backgroundDrawStyle);
	gc.SetTileColor(colBackground);
	gc.DrawTexture(11, 6, 256, 256, 0, 0, texBackground);
}


// ----------------------------------------------------------------------
// PostDrawBorder()
// ----------------------------------------------------------------------

function DrawBorder(GC gc)
{
	if (bDrawBorder)
	{
		gc.SetStyle(borderDrawStyle);
		gc.SetTileColor(colBorder);
		gc.DrawTexture(0, 0, 256, 256, 0, 0, texBorder);
	}
}

// ----------------------------------------------------------------------
// CreateCompassWindow()
// ----------------------------------------------------------------------

function CreateCompassWindow()
{
	local Window winCompassClip;

	winCompassClip = NewChild(Class'Window');
	winCompassClip.SetSize(clipWidth, 256);
	winCompassClip.SetPos(13, 7);
}


// ----------------------------------------------------------------------
// SetVisibility()
// ----------------------------------------------------------------------

function SetVisibility( bool bNewVisibility )
{
	Show( bNewVisibility );

	bTickEnabled = bNewVisibility;
}


// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     colTickMarks=(R=200,G=200,B=200)
     clipWidth=55
     tickWidth=240
     texBackground=Texture'DeusExUI.UserInterface.ComputerHackBackground'
     texBorder=Texture'DeusExUI.UserInterface.ComputerHackBorder'
     texTickBox=Texture'DeusExUI.UserInterface.HUDCompassTickBox'
}
