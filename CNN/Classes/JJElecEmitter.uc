//-----------------------------------------------------------
//
//-----------------------------------------------------------
class JJElecEmitter extends ElectricityEmitter;

var () float changePosTime;
var () float accumTime;
var rotator rot;
//var rotator rot1;
//var rotator rot2;
//var vector vec1;
//var vector vec2;

function PostBeginPlay()
{
    super.PostBeginPlay();
    DrawScale = 2;
}

function CalcTrace(float deltaTime)
{
	local vector StartTrace, EndTrace, HitLocation, HitNormal, loc, jjV;
	local Rotator r;
	local actor target;
	local int texFlags;
	local name texName, texGroup;

	if (!bHiddenBeam)
	{
		// set up the random beam stuff

		if ( accumTime >= changePosTime )
		{
            accumTime -= accumTime;
            accumTime += 0.000001;
        ////////////////////
//        vec1 = vect(0,1,0);

//		r.Pitch = Int((0.5 - FRand()) * randomAngle);
//		r.Yaw = Int((0.5 - FRand()) * randomAngle);
//		r.Roll = Int((0.5 - FRand()) * randomAngle);
//		vec2 = vect(0,1,0) >> r;

		rot.Pitch = Int((0.5 - FRand()) * randomAngle);
		rot.Yaw = Int((0.5 - FRand()) * randomAngle);
		rot.Roll = Int((0.5 - FRand()) * randomAngle);

        ////////////////////
        }
        else
        {
            //rot = interpolateRotation( changePosTime / accumTime, rot(0,0,0), rot(0,0,0));

            //jjV = interpolateVector( changePosTime / accumTime, vec1, vec2 );
            //rot = rotator(jjV);

            accumTime += deltaTime;
        }



		StartTrace = Location;
		EndTrace = Location + 5000 * vector(Rotation + rot);
		HitActor = None;

		foreach TraceTexture(class'Actor', target, texName, texGroup, texFlags, HitLocation, HitNormal, EndTrace, StartTrace)
		{
			if ((target.DrawType == DT_None) || target.bHidden)
			{
				// do nothing - keep on tracing
			}
			else if ((target == Level) || target.IsA('Mover'))
			{
				break;
			}
			else
			{
				HitActor = target;
				break;
			}
		}

		lastDamageTime += deltaTime;

		// shock whatever gets in the beam
		if ((HitActor != None) && (lastDamageTime >= damageTime))
		{
			HitActor.TakeDamage(damageAmount, Instigator, HitLocation, vect(0,0,0), 'Shocked');
			lastDamageTime = 0;
		}

		if (LaserIterator(RenderInterface) != None)
			LaserIterator(RenderInterface).AddBeam(0, Location, Rotation + rot, VSize(Location - HitLocation));
	}
}








DefaultProperties
{
 accumTime=0;



 changePosTime=1.0;
 beamTexture=FireTexture'Effects.Electricity.Nano_SFX'
 bEmitLight=True
 bFlicker=false         // delay
 bInitiallyOn=True
 DamageAmount=1
 damageTime=0.5
 flickerTime=0.8
// randomAngle=65536.0
 randomAngle=12000.0
// randomAngle=1000.0
 //bRandomBeam=false
 //bDirectional=false
// Physics=PHYS_Rotating
/*
     bRandomBeam=True
     bDirectional=True
     DrawType=DT_Sprite
     Texture=Texture'Engine.S_Inventory'
     SoundRadius=64
     AmbientSound=Sound'Ambient.Ambient.Electricity4'
     LightBrightness=128
     LightHue=150
     LightSaturation=32
     LightRadius=6
*/
}
