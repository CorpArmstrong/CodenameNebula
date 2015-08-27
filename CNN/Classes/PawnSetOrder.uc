//-----------------------------------------------------------
//
//-----------------------------------------------------------
class PawnSetOrder expands RayCastTrigger;




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
			msgbox("order+");
		}
	}
}

DefaultProperties
{

}
