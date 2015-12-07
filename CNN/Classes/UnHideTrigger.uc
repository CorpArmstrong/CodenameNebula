//-----------------------------------------------------------
//
//-----------------------------------------------------------
class UnHideTrigger expands CNNSimpleTrigger;

var () name ShowingActorTag;

function ActivatedON()
{
	local Actor A;

	foreach AllActors( class'Actor', A, ShowingActorTag )
		A.bHidden = false;

	super.ActivatedON();
}

DefaultProperties
{

}
