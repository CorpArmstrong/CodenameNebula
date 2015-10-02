//-----------------------------------------------------------
//
//-----------------------------------------------------------
class CNNSphereFragment extends CNNActor;

//var texture myTexture;

var int synchParam;

function Tick(float deltaTime)
{
         super.Tick(deltaTime);
}

DefaultProperties
{

     synchParam=2

     bUnlit=false

     //myTexture=Texture'Effects.Nano_SFX';
     //myTexture.bUnlit=true;

     Mesh=LodMesh'DeusExItems.Moon'
     MultiSkins(0)=Texture'Effects.Nano_SFX'
     //MultiSkins(0)=myTexture;
     DrawType=DT_Mesh
     Style=STY_Translucent
     Physics=PHYS_None
}
