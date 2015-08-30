//-----------------------------------------------------------
//
//-----------------------------------------------------------
class CollisionTrigger expands CNNSimpleTrigger;


var (Trigger) enum ETouchProximityType // TODO touchprox to touch
{
    TPT_DisableTouch,
    TPT_Player, // TODO
    TPT_Class,  // TODO
    TPT_Tag,
} TouchProximityType;


//var (Trigger) bool bUseRayCast; - TPT_DisableTouch
var (Trigger) name RayCastingTag;
var (Trigger) name RayCastingClass;//not used now

var bool bObjectInside;

function bool TouchProximity ( Actor A )
{
	return false;
}

function Tick( float fDT )
{
local Actor A;
local vector distaceToObj;
local bool bPrevInsideValue;

super.tick(fDT);

	bPrevInsideValue = bObjectInside;


	// detecting a Object Inside
	if ( TouchProximityType != TPT_DisableTouch )
    {
        ForEach AllActors(class 'Actor', A)
        {
			if ( A.Tag == RayCastingTag )
            {
                distaceToObj = self.Location - A.Location;

                distaceToObj.x = abs(distaceToObj.x);
                distaceToObj.y = abs(distaceToObj.y);
                distaceToObj.z = 0;/// BECAREFULL not procesed a height of inside targets

                if (VSize(distaceToObj) <= self.CollisionRadius)
                {
					bObjectInside = true;
					//gamelog("inside");
				}
				else
				{
					bObjectInside = false;
				}
            }
        }
    }

	//detectiong  Togle and UnTogle
	if ( bPrevInsideValue != bObjectInside )
	{
		if ( !bPrevInsideValue && bObjectInside )
			ToggleON();

		if ( bPrevInsideValue && !bObjectInside )
			ToggleOFF();
	}


}

function ToggleON()
{
	gamelog("TogleON()");
}

function ToggleOFF()
{
	gamelog("TogleOFF()");
}



DefaultProperties
{
    TouchProximityType=TPT_Tag;
}
