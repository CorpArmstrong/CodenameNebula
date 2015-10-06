//-----------------------------------------------------------
//
//-----------------------------------------------------------
class CNNTrigger expands Trigger;

function MsgBox ( string message )
{
    local DeusExPlayer player;
    player = DeusExPlayer(GetPlayerPawn());
    player.clientMessage( message );
}

DefaultProperties
{
	Texture=Texture'CNN.S_CNNTrig';
}
