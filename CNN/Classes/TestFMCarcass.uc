//-----------------------------------------------------------
//  Test cop carcass to demonstate corpse burning effect
//-----------------------------------------------------------
class TestFMCarcass extends CopCarcass;

var() float Flammability;			// how long does the object burn?
var FlagBase flags;
var DeusExPlayer player;
var bool isBurning;
var Fire f;
var int i;
var vector loc;

function TakeDamage(int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType)
{
	if ((DamageType == 'Burned') || (DamageType == 'Flamed'))
    {
		if (!isBurning)
    	{
			StillBurn();
			isBurning = true;
    	    SetTimer(Flammability-5, true);
    	}
	}
}

// continually burn
function Timer()
{
    player = DeusExPlayer(GetPlayerPawn());
    flags = player.FlagBase;

    if(!flags.GetBool('LaserSecurityWorks'))
    {
       isBurning = false;
       ExtinguishFire();
       SetTimer(0.1, false);
    }
    else
    {
       StillBurn();
    }
}

function StillBurn()
{
	for (i=0; i<8; i++)
	{
		loc.X = 0.9*CollisionRadius * (1.0-2.0*FRand());
		loc.Y = 0.9*CollisionRadius * (1.0-2.0*FRand());
		loc.Z = 0.9*CollisionHeight * (1.0-2.0*FRand());
		loc += Location;
		f = Spawn(class'Fire', Self,, loc);

        if (f != None)
		{
			f.DrawScale = FRand() + 1.0;
			f.LifeSpan = Flammability;

			// turn off the sound and lights for all but the first one
			if (i > 0)
			{
				f.AmbientSound = None;
				f.LightType = LT_None;
			}

			// turn on/off extra fire and smoke
			if (FRand() < 0.5)
				f.smokeGen.Destroy();
			if (FRand() < 0.5)
				f.AddFire(1.5);
		}
    }
}

DefaultProperties
{
     Flammability=30.000000
     isBurning=false
}
