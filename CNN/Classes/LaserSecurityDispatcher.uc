//-----------------------------------------------------------
//  LaserSecurityDispatcher
//-----------------------------------------------------------
class LaserSecurityDispatcher expands Actor;
var() float delay;
var() name targetTag[4];
var() bool bIsOn;

function PostBeginPlay()
{
    DeusExPlayer(GetPlayerPawn()).ClientMessage("!!!!!!!!!!!!!!");
}

function Timer()
{
    SendMessages();

    DeusExPlayer(GetPlayerPawn()).ClientMessage("function Timer()");
}

function SendMessages()
{
    local Mover m;
    local int i;

    if( bIsOn )
    {
        for (i = 0; i < 4; i ++ )
            foreach AllActors( class 'Mover', m, targetTag[i] )
        	    m.Trigger( Self, None );
    }
}

function Tick(float fDT)
{


Super.Tick(fDT);
}

function ToggleOn()
{
    bIsOn = true;
    SendMessages();
    SetTimer(delay, true);
    DeusExPlayer(GetPlayerPawn()).ClientMessage("function ToggleOn()");
}

function ToggleOff()
{
    bIsOn = false;
    SendMessages();
    SetTimer(0.1, false);
    DeusExPlayer(GetPlayerPawn()).ClientMessage("function ToggleOff()");
}


DefaultProperties
{
    bIsOn=False;
    delay=20
    targetTag(0)="LaserEmittersMoverFR"
    targetTag(1)="LaserEmittersMoverFL"
    targetTag(2)="LaserEmittersMoverBR"
    targetTag(3)="LaserEmittersMoverBL"
}
