//-----------------------------------------------------------
// for ups only
//-----------------------------------------------------------
class UpsSelfDestructTrigger expands CollisionTrigger;
var () name PawnTag;

function ActivatedON()
{
local CNNUPS p;
local Actor grenade;
//local Actor grenadeS;

	super.ActivatedON();

	foreach AllActors( class'CNNUPS', p )
	if ( p.Tag == PawnTag )
	{
		p.SelfDestruction();
	}
}

DefaultProperties
{

}
