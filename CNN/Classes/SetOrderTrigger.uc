//-----------------------------------------------------------
//
//-----------------------------------------------------------
class SetOrderTrigger expands CollisionTrigger;




var () name PawnTag;
var () name PawnOrder;
var () name PawnOrderTag;

function ActivatedON()
{
local ScriptedPawn A;

	super.ActivatedON();

	foreach  AllActors(class'ScriptedPawn', A)
	{
		if ( A.Tag == PawnTag )
		{
			A.SetOrders( PawnOrder, PawnOrderTag, true );
			gamelog("order+");
		}
	}
}

DefaultProperties
{

}
