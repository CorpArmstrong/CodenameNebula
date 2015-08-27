//-----------------------------------------------------------
//
//-----------------------------------------------------------
class CNNSimpleTrigger expands Triggers;

function MsgBox ( string message )
{
    local DeusExPlayer player;
    player = DeusExPlayer(GetPlayerPawn());
    player.clientMessage( level.TimeSeconds @ self.Name$":" @ message );
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

}
