//-----------------------------------------------------------
//
//-----------------------------------------------------------
class SetOrderTrigger expands CollisionTrigger;




var () name PawnTag;
var () name PawnOrder;
var () name PawnOrderTag;

function ToggleON()
{
local ScriptedPawn A;

	super.ToggleON();

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
