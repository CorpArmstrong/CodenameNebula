//-----------------------------------------------------------
//
//-----------------------------------------------------------
class CNNSimpleTrigger expands Triggers;

var (Trigger) bool bShowDebugInfo;
var (DebugInfo) bool bShowTime;
var (DebugInfo) bool bShowName;
var (DebugInfo) bool bShowTag;

var (Trigger) enum ETouchProximityType
{
    TPT_TouchToPlayer,
    TPT_TouchByClass,           // just any actor. recomended use with NON each tick checking
    TPT_TouchByTag,             // seeking actor must be a ScriptedPawn
} TouchProximityType;

var (Trigger) name TouchByTag;
var (Trigger) name TouchByClass;

var (Trigger) enum ECheckCollisionEvery
{
	CCE_NeverCheck,
	CCE_EveryTick,
	CCE_dot1sec,
	CCE_dot2sec,
	CCE_dot3sec,
	CCE_dot5sec,
	CCE_1sec,
	CCE_2sec,
	CCE_3sec,
	CCE_5sec,
}CheckCollisionEvery;
var float CollisionTimeDelay;
var float NextCheckAfter;

var bool bObjectInside;


function PostBeginPlay()
{
	super.PostBeginPlay();

	switch (CheckCollisionEvery)
	{
		case CCE_EveryTick:
			CollisionTimeDelay = 0;
			break;
		case CCE_dot1sec:
			CollisionTimeDelay = 0.1;
			break;
		case CCE_dot2sec:
			CollisionTimeDelay = 0.2;
			break;
		case CCE_dot3sec:
			CollisionTimeDelay = 0.3;
			break;
		case CCE_dot5sec:
			CollisionTimeDelay = 0.5;
			break;
		case CCE_1sec:
			CollisionTimeDelay = 1;
			break;
		case CCE_2sec:
			CollisionTimeDelay = 2;
			break;
		case CCE_3sec:
			CollisionTimeDelay = 3;
			break;
		case CCE_5sec:
			CollisionTimeDelay = 5;
			break;

	}
	NextCheckAfter = CollisionTimeDelay;
}


function DebugInfo ( string message )
{
    local String mess;

    if (!bShowDebugInfo) return;

	if(bShowTime)
		mess = ""$level.TimeSeconds;

	if(bShowName)
		mess = mess @ self.Name;

	if(bShowTag)
		mess = mess @ self.Tag;

    mess = mess$":" @ message;

	GameLog(mess);
}


function GameLog ( string message )
{
    local DeusExPlayer player;

    player = DeusExPlayer(GetPlayerPawn());

    if ( player != None )
	    player.clientMessage( message );
}


// detect touching (true\false)
function bool IsTouchTo ( Actor Other )
{
	local vector distance;
	local vector distanceInPlane;

	distance = self.Location - Other.Location;

	distanceInPlane = distance;
	distanceInPlane.Z = 0;

	distance.Z = abs( distance.Z );

	if( distance.Z <= ((self.CollisionHeight + Other.CollisionHeight) / 2) )
		if( VSize(distanceInPlane) <= (self.CollisionRadius + Other.CollisionRadius) )
		{
			return true;
		}

	return false;
}


// general touch function
// (calls CheckActorsTouch() with time interval)
function TouchProcessing( float fDT )
{
	local bool bPrevInsideValue;

	// time managament (time delay)
    NextCheckAfter -= fDT;
	if ( NextCheckAfter > 0 )
		return;
	else
		NextCheckAfter = CollisionTimeDelay;

	//gamelog("TouchProcessing"@NextCheckAfter);

	// save previous value
	bPrevInsideValue = bObjectInside;

	// verify is Object Inside ?
	bObjectInside = CheckActorsTouch();

	//detectiong  Touch and UnTouch
	if ( bPrevInsideValue != bObjectInside )
	{
		if ( !bPrevInsideValue && bObjectInside )
			TouchIN();

		if ( bPrevInsideValue && !bObjectInside )
			TouchOUT();
	}
}


// make checking collision
// with selected TouchProximityType
function bool CheckActorsTouch()
{
	local DeusExPlayer player;
	local Actor actr;
	local ScriptedPawn sPawn;
	local bool result;

	result = false;

    switch ( TouchProximityType )
	{
		case TPT_TouchToPlayer:
		    player = DeusExPlayer(GetPlayerPawn()); // not for multiplayer games

		    if (player != None)
		    	return IsTouchTo(player);
			break;

		case TPT_TouchByClass:
			ForEach AllActors(class 'Actor', actr)
			{
				if ( actr.IsA(TouchByClass) )
					if ( IsTouchTo(actr) )
						result = true;
			}
			break;

		case TPT_TouchByTag:
			ForEach AllActors(class 'ScriptedPawn', sPawn)
       		{
				if ( sPawn.Tag == TouchByTag )
					if ( IsTouchTo(sPawn) )
						result = true;
	        }
			break;
	}

	return result;
}


function Tick( float fDT )
{
	super.tick(fDT);

	if ( CheckCollisionEvery != CCE_NeverCheck )
		TouchProcessing(fDT);
}


function TouchIN() // analog Touch
{
	ActivatedON();
}

function TouchOUT() // analog UnTouch
{
	ActivatedOFF();
}


function Trigger( Actor Other, Pawn EventInstigator )
{
	ActivatedON();
	super.Trigger( Other, EventInstigator );
}

function UnTrigger( Actor Other, Pawn EventInstigator )
{
	ActivatedOFF();
	super.UnTrigger( Other, EventInstigator );
}


function ActivatedON() // when trigger become activated
{
	DebugInfo("ActivatedON()");
}

function ActivatedOFF() // when trigger is deactivated
{
	DebugInfo("ActivatedOFF()");
}


DefaultProperties
{
	bShowDebugInfo=false;
	bShowTime=true;
	bShowName=false;
	bShowTag=false;

	TouchProximityType=TPT_TouchByTag;
	CheckCollisionEvery=CC_dot1sec;
	NextCheckAfter=0;
}
