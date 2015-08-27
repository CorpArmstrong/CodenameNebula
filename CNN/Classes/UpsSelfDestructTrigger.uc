//-----------------------------------------------------------
// for ups only
//-----------------------------------------------------------
class UpsSelfDestructTrigger expands RayCastTrigger;
var () name PawnTag;

function ToggleON()
{
local ScriptedPawn p;
local Actor grenade;
//local Actor grenadeS;

	super.ToggleON();

	foreach AllActors( class'ScriptedPawn', p )
	if ( p.Tag == PawnTag )
	{
		p.bInvincible = false;
		//p.bCollideActors = true;
		p.SetCollision( true, true, true);

		grenade = Spawn(class'LAM', none);
		//grenade = ScriptedPawn(Spawn(class'CNNSphereFragment', none));
		grenade.SetLocation( p.Location + vect(+50,0,+40) );
		grenade.SetPhysics(PHYS_None);
		grenade.AttachTag = PawnTag;  //not working *trollface*
		msgbox("grenade+");

		grenade = Spawn(class'LAM', none);
		//grenade = ScriptedPawn(Spawn(class'CNNSphereFragment', none));
		grenade.SetLocation( p.Location + vect(-50,0,+40) );
		grenade.SetPhysics(PHYS_None);
		grenade.AttachTag = PawnTag;  //not working *trollface*
		msgbox("grenade+");

		grenade = Spawn(class'LAM', none);
		//grenade = ScriptedPawn(Spawn(class'CNNSphereFragment', none));
		grenade.SetLocation( p.Location + vect(0,+50,+40) );
		grenade.SetPhysics(PHYS_None);
		grenade.AttachTag = PawnTag;  //not working *trollface*
		msgbox("grenade+");

		grenade = Spawn(class'LAM', none);
		//grenade = ScriptedPawn(Spawn(class'CNNSphereFragment', none));
		grenade.SetLocation( p.Location + vect(0,-50,+40) );
		grenade.SetPhysics(PHYS_None);
		grenade.AttachTag = PawnTag;  //not working *trollface*
		msgbox("grenade+");

	}
}

DefaultProperties
{

}
