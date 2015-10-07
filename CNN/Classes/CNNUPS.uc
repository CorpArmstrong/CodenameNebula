//-----------------------------------------------------------
// unknown paranormal shit          komentariy v kot
//-----------------------------------------------------------
class CNNUPS extends CNNDog;

// var int ORBIT_RADIUS = 15;

var JJElecEmitter em[15];
var CNNSphereFragment spheres[6];
var LAM grenades[4];

function PostBeginPlay()
{
    local int i;

    super.PostBeginPlay();

    //self.DrawType = DT_None;

    for ( i = 0; i < 12+3; i ++ )
    {
        em[i] = Spawn(class'JJElecEmitter', self);
        em[i].SetLocation(self.Location + vect(0,0,25));
        if ( i < 12 )
        {
           em[i].AttachTag = self.Tag;
           em[i].accumTime = 0.084 * i;
        }else
        {
           // attaching later
           em[i].accumTime = 0.0;
           em[i].randomAngle = 0;
        }
    }

    for ( i = 0; i < 3; i ++ )
    {
        spheres[i] = Spawn(class'CNNSphereFragment', self);
        spheres[i].SetLocation(self.Location + vect(0,0,25));
//        spheres[i].mesh = LodMesh'DeusExItems.Binoculars';
        spheres[i].AttachTag = self.Tag;
        spheres[i].DrawScale = 0.2f * (i+1);
    }

    for ( i = 3; i < 6; i ++ )
    {
        spheres[i] = Spawn(class'CNNSphereFragment', self);
        spheres[i].DrawScale = 0.05f;
    }

    spheres[3].SetLocation(self.Location + vect(0,0,25) + vect(23,0,0));
    spheres[3].AttachTag = self.Tag;
  //spheres[3].Style = STY_Normal;
  //spheres[3].bUnlit = true;
    spheres[3].MultiSkins[0] = Texture'Effects.Virus_SFX'; //Texture'Effects.LaserBeam1';

    spheres[4].SetLocation(self.Location + vect(0,0,25) + vect(0,23,0));
    spheres[4].AttachTag = self.Tag;
  //spheres[4].Style = STY_Normal;
  //spheres[4].bUnlit = true;
    spheres[4].MultiSkins[0] = Texture'Effects.Virus_SFX'; //Texture'Effects.LaserBeam1';

    spheres[5].SetLocation(self.Location + vect(0,0,25) + vect(0,0,23));
    spheres[5].AttachTag = self.Tag;
  //spheres[5].Style = STY_Normal;
  //spheres[5].bUnlit = true;
    spheres[5].MultiSkins[0] = Texture'Effects.Virus_SFX'; //Texture'Effects.LaserBeam1';


      spheres[0].Style = STY_Normal;
      spheres[0].bUnlit = true;
    //spheres[0].bCollideActors = true; // for red rays


// front
    em[0].SetRotation(rot(0,0,0));
    em[1].SetRotation(rot(0,0,0));
// left probably
    em[2].SetRotation(rot(0,16384,0));
    em[3].SetRotation(rot(0,16384,0));
// back
    em[4].SetRotation(rot(0,49152,0));
    em[5].SetRotation(rot(0,49152,0));
// right probably
    em[6].SetRotation(rot(0,32768,0));
    em[7].SetRotation(rot(0,32768,0));
// up probably
    em[8].SetRotation(rot(16384,0,0));
    em[9].SetRotation(rot(16384,0,0));
// down probably
    em[10].SetRotation(rot(49152,0,0));
    em[11].SetRotation(rot(49152,0,0));

    em[12].proxy.Skin=Texture'Effects.Virus_SFX';
    em[13].proxy.Skin=Texture'Effects.Virus_SFX';
    em[14].proxy.Skin=Texture'Effects.Virus_SFX';

    SelfDestructionGrenades();
}

function PlayDogBark()
{
/*
	if (FRand() < 0.5)
		PlaySound(sound'DogLargeBark2', SLOT_None);
	else
		PlaySound(sound'DogLargeBark3', SLOT_None);
		*/
}


function Tick(float deltaTime)
{
 local int i;
 local vector tmpVect;
 local int tmpInt;
 local rotator tmpRotator;

 local vector coordsSmallBall, coordsCentralBall;

      super.Tick(deltaTime);

          /*
          get a local vector
          rotate local vector
          set local vector

          1) World coord of small ball - world coords of central ball
          2) -
          3) local vector + coords of central ball
          */

          coordsCentralBall = spheres[2].Location;

          // 1
          coordsSmallBall = spheres[3].Location;
          coordsSmallBall -= coordsCentralBall;

          // 2, 3
          tmpRotator = rot(9000,0,0);
          tmpVect = coordsSmallBall << (tmpRotator*deltaTime);
          spheres[3].SetLocation(tmpVect + coordsCentralBall);

          em[12].SetLocation(spheres[3].Location);
          tmpVect *= -1;
          em[12].SetRotation(rotator(tmpVect));

          //----------------------------------------
          // 1
          coordsSmallBall = spheres[4].Location;
          coordsSmallBall -= coordsCentralBall;

          // 2, 3
          tmpRotator = rot(0,9000,0);
          tmpVect = coordsSmallBall << (tmpRotator*deltaTime);
          spheres[4].SetLocation(tmpVect + coordsCentralBall);

          em[13].SetLocation(spheres[4].Location);
          tmpVect *= -1;
          em[13].SetRotation(rotator(tmpVect));
          //----------------------------------------
          // 1
          coordsSmallBall = spheres[5].Location;
          coordsSmallBall -= coordsCentralBall;

          // 2, 3
          tmpRotator = rot(0,0,9000);
          tmpVect = coordsSmallBall << (tmpRotator*deltaTime);
          spheres[5].SetLocation(tmpVect + coordsCentralBall);

          em[14].SetLocation(spheres[5].Location);
          tmpVect *= -1;
          em[14].SetRotation(rotator(tmpVect));
          //----------------------------------------
}

function SelfDestructionGrenades()
{
local int i;

	for ( i = 0; i < 4; i ++ )
	{
		grenades[i] = Spawn(class'LAM', none);
		grenades[i].SetPhysics(PHYS_None);
		grenades[i].AttachTag = self.Tag;
//		grenades[i].DrawType = DT_none;
		grenades[i].bHidden = true;
		grenades[i].fuseLength = 0.01;
		grenades[i].bDisabled = true;
		grenades[i].SetCollision( false, false, false);
	}

	grenades[0].SetLocation( self.Location + vect(+50,0,-25) );
	grenades[1].SetLocation( self.Location + vect(-50,0,-25) );
	grenades[2].SetLocation( self.Location + vect(0,+50,-25) );
	grenades[3].SetLocation( self.Location + vect(0,-50,-25) );
}

function SelfDestruction()
{
local int i;

	self.bInvincible = false;
	//self.bCollideActors = true;
	self.SetCollision( true, true, true);

	for ( i = 0; i < 4; i ++ )
	{
		grenades[i].bDisabled = false;
		grenades[i].bDamaged = true;
		grenades[i].Explode(grenades[i].Location, Vector(grenades[i].Rotation));
	}
	//destroy();
}



function Destroyed()
{
    local int i;

    for ( i = 0; i < 15; i ++ )
       em[i].Destroy();

    for ( i = 0; i < 6; i ++ )
       spheres[i].Destroy();

	Super.Destroyed();
}

defaultproperties
{
     bPlayDying=False
     CarcassType=None
     bInvincible=True
     bHidden=True
     DrawType=DT_Sprite
     CollisionHeight=50.000000
}
