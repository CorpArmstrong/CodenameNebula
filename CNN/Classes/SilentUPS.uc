//-----------------------------------------------------------
//
//-----------------------------------------------------------
class SilentUPS expands CNNUPS;

function PostBeginPlay()
{
	local int i;

	super.PostBeginPlay();

	for (i = 0; i < 12+3; i ++)
		em[i].AmbientSound = None;

}

DefaultProperties
{

}
