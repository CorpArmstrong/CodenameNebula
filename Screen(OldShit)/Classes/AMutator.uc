//-----------------------------------------------------------
//
//-----------------------------------------------------------
class AMutator expands Mutator;

var bool bHUDMutator;
var Mutator NextMessageMutator;
var Mutator NextHUDMutator;

function bool MutatorTeamMessage( Actor Sender, Pawn Receiver, PlayerReplicationInfo PRI, coerce string S, name Type, optional bool bBeep )
{
	if ( NextMessageMutator != None )
		// FIXME: CorpArmstrong
		return true;//NextMessageMutator.MutatorTeamMessage( Sender, Receiver, PRI, S, Type, bBeep );
	else
		return true;
}

// FIXME: CorpArmstrong
// There is no HUDMutator field in DeusEx's PlayerPawn!
// You probably should subclass PlayerPawn ?

// Registers the current mutator on the client to receive PostRender calls.
simulated function RegisterHUDMutator()
{
	local Pawn P;

	ForEach AllActors(class'Pawn', P)
		if ( P.IsA('PlayerPawn') && (PlayerPawn(P).myHUD != None) )
		{
			//NextHUDMutator = PlayerPawn(P).myHUD.HUDMutator; //PlayerPawn(P).myHud.HUDMutator;
			//PlayerPawn(P).myHUD.HUDMutator = Self;
			bHUDMutator = True;
		}
}

DefaultProperties
{

}
