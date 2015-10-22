//-----------------------------------------------------------
//  my own Dispatcher analog (maybe ugly.. i know)
//-----------------------------------------------------------
class CnnDispatcher expands CNNSimpleTrigger;

// features:
// 1) call Trigger() by the PlayerPawn
// 2) can react on collision
// 3) Sleep() work with empty event's (like a not empty)
// 4) maybe include a some bugs :)

var (Dispatcher) name  OutEvents[8]; // Events to generate.
var (Dispatcher) float OutDelays[8]; // Relative delays before generating events.
var int i;

function ActivatedON()
{
	bEnabled = false;      // prevent to triggering\touching
	gotostate('Dispatch');
}

//
// Dispatch events.
//
state Dispatch
{
Begin:
	disable('ActivatedON');
	for( i=0; i<ArrayCount(OutEvents); i++ )
	{
		if( OutEvents[i] != '' )
		{
			Sleep( OutDelays[i] );
			foreach AllActors( class 'Actor', Target, OutEvents[i] )
				Target.Trigger( Self, GetPlayerPawn() );
		}
		else
			Sleep( OutDelays[i] );
	}
	enable('ActivatedON');
	super.ActivatedON(); // calls events, and restore bEnabled if it's needs
}


DefaultProperties
{

}
