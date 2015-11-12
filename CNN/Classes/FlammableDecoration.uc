//-----------------------------------------------------------
//
//-----------------------------------------------------------
class FlammableDecoration expands DeusExDecoration;

// ----------------------------------------------------------------------
// state Burning - Copied from DeusExDecoration
//
// We are burning and slowly taking damage
// ----------------------------------------------------------------------

state Burning
{
	function TakeDamage(int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType)
	{
		local float avg;

		if ((DamageType == 'TearGas') || (DamageType == 'PoisonGas') || (DamageType == 'Radiation'))
			return;

		if ((DamageType == 'EMP') || (DamageType == 'NanoVirus') || (DamageType == 'Shocked'))
			return;

		if (DamageType == 'HalonGas')
			ExtinguishFire();

		// if we are already burning, we can't take any more damage
		if ((DamageType == 'Burned') || (DamageType == 'Flamed'))
		{
			HitPoints -= Damage/2;
		}
		else
		{
			if (Damage >= minDamageThreshold)
				HitPoints -= Damage;
		}

		if (bExplosive)
			HitPoints = 0;

		if (HitPoints > 0)		// darken it to show damage (from 1.0 to 0.1 - don't go completely black)
		{
			ResetScaleGlow();
		}
		else	// destroy it!
		{
			DropThings();

			// clear the event to keep Destroyed() from triggering the event
			Event = '';
			avg = (CollisionRadius + CollisionHeight) / 2;
			Frag(fragType, Momentum / 10, avg/20.0, avg/5 + 1);
			Instigator = EventInstigator;
			if (Instigator != None)
				MakeNoise(1.0);

			// if we have been blown up, then destroy our contents
			if (bExplosive)
			{
				Contents = None;
				Content2 = None;
				Content3 = None;
				Explode(HitLocation);
			}
		}
	}

	// continually burn and do damage
	function Timer()
	{
		if (bPushSoundPlaying)
		{
			StopSound(pushSoundId);
			AIEndEvent('LoudNoise', EAITYPE_Audio);
			bPushSoundPlaying = False;
		}
		// Modify this, to prevent taking damage.
		//TakeDamage(2, None, Location, vect(0,0,0), 'Burned');
		TakeDamage(0, None, Location, vect(0,0,0), 'Burned');
	}

	function BeginState()
	{
		local Fire f;
		local int i;
		local vector loc;

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

		// set the burn timer
		SetTimer(1.0, True);
	}
}

DefaultProperties
{

}
