//-----------------------------------------------------------
//
//-----------------------------------------------------------
class CNNSimpleTrigger expands Triggers;

var (Trigger) bool bShowDebugInfo;
var (DebugInfo) bool bShowTime;
var (DebugInfo) bool bShowName;
var (DebugInfo) bool bShowTag;

function GameLog ( string message )
{
    local DeusExPlayer player;
    local String mess;

    if (!bShowDebugInfo) return;

	if(bShowTime)
		mess = ""$level.TimeSeconds;

	if(bShowName)
		mess = mess @ self.Name;

	if(bShowTag)
		mess = mess @ self.Tag;

    mess = mess$":" @ message;


    player = DeusExPlayer(GetPlayerPawn());
    player.clientMessage( mess );
}

function bool IsTouchTo ( Actor Other )
{
local vector distanceInPlane;
local vector distanceByVertical;

distanceInPlane = self.Location - Other.Location;

distanceByVertical = distanceInPlane;

distanceInPlane.X = abs(distanceInPlane.X);
distanceInPlane.Y = abs(distanceInPlane.Y);
distanceInPlane.Z = 0;

distanceByVertical.X = 0;
distanceByVertical.Y = 0;
distanceByVertical.Z = abs(distanceByVertical.Z);

/// if(  )

return false;
}

DefaultProperties
{
bShowDebugInfo=false;
bShowTime=true;
bShowName=false;
bShowTag=false;
}
