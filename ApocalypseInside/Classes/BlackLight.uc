//-----------------------------------------------------------
//
//-----------------------------------------------------------
class BlackLight expands CNNUPS;

function PostBeginPlay()
{
    local int i;

    super.PostBeginPlay();

    //self.DrawType = DT_None;

    // electric emmiters
	for ( i = 0; i < 12+6; i ++ )
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

    // blue cores-spheres
	for ( i = 0; i < 3; i ++ )
    {
        spheres[i] = Spawn(class'AiSphereFragment', self);
        spheres[i].SetLocation(self.Location + vect(0,0,25));
//        spheres[i].mesh = LodMesh'DeusExItems.Binoculars';
        spheres[i].AttachTag = self.Tag;
        spheres[i].DrawScale = 0.2f * (i+1);
    }

    // small balls
//	for ( i = 3; i < 6; i ++ )
	for ( i = 3; i < 9; i ++ )
    {
        spheres[i] = Spawn(class'AiSphereFragment', self);
        spheres[i].DrawScale = 0.05f;
    }

    spheres[3].SetLocation(self.Location + vect(0,0,25) + vect(23,0,0));
    spheres[3].AttachTag = self.Tag;
  //spheres[3].Style = STY_Normal;
  //spheres[3].bUnlit = true;
    spheres[3].MultiSkins[0] = Texture'Effects.UserInterface.DrunkFX'; //Texture'Effects.LaserBeam1';

    spheres[4].SetLocation(self.Location + vect(0,0,25) + vect(0,23,0));
    spheres[4].AttachTag = self.Tag;
  //spheres[4].Style = STY_Normal;
  //spheres[4].bUnlit = true;
    spheres[4].MultiSkins[0] = Texture'Effects.UserInterface.DrunkFX'; //Texture'Effects.LaserBeam1';

    spheres[5].SetLocation(self.Location + vect(0,0,25) + vect(0,0,23));
    spheres[5].AttachTag = self.Tag;
  //spheres[5].Style = STY_Normal;
  //spheres[5].bUnlit = true;
    spheres[5].MultiSkins[0] = Texture'Effects.UserInterface.DrunkFX'; //Texture'Effects.LaserBeam1';
/**/
    spheres[6].SetLocation(self.Location + vect(0,0,25) + vect(-23,0,0));
    spheres[6].AttachTag = self.Tag;
  //spheres[6].Style = STY_Normal;
  //spheres[6].bUnlit = true;
    spheres[6].MultiSkins[0] = Texture'Effects.UserInterface.DrunkFX'; //Texture'Effects.LaserBeam1';

    spheres[7].SetLocation(self.Location + vect(0,0,25) + vect(0,-23,0));
    spheres[7].AttachTag = self.Tag;
  //spheres[7].Style = STY_Normal;
  //spheres[7].bUnlit = true;
    spheres[7].MultiSkins[0] = Texture'Effects.UserInterface.DrunkFX'; //Texture'Effects.LaserBeam1';

    spheres[8].SetLocation(self.Location + vect(0,0,25) + vect(0,0,-23));
    spheres[8].AttachTag = self.Tag;
  //spheres[8].Style = STY_Normal;
  //spheres[8].bUnlit = true;
    spheres[8].MultiSkins[0] = Texture'Effects.UserInterface.DrunkFX'; //Texture'Effects.LaserBeam1';
/**/

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

    em[12].proxy.Skin=Texture'Effects.UserInterface.DrunkFX';
    em[13].proxy.Skin=Texture'Effects.UserInterface.DrunkFX';
    em[14].proxy.Skin=Texture'Effects.UserInterface.DrunkFX';

    em[15].proxy.Skin=Texture'Effects.UserInterface.DrunkFX';
    em[16].proxy.Skin=Texture'Effects.UserInterface.DrunkFX';
    em[17].proxy.Skin=Texture'Effects.UserInterface.DrunkFX';

    SelfDestructionGrenades();
}


defaultproperties
{
}
