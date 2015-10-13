//-----------------------------------------------------------
// Mission01 - Lower level (low level)
//-----------------------------------------------------------
class CNNMisson01 expands MissionScript;
var bool bLasersOn, bLasersOff;
var LaserSecurityDispatcher laserDipatcher;
var bool bFirstFrame;

var () name CamTag;

// ----------------------------------------------------------------------
// FirstFrame()
//
// Stuff to check at first frame
// ----------------------------------------------------------------------
function FirstFrame() {
  Super.FirstFrame();


}

function InitStateMachine() {

    super.InitStateMachine();
    FirstFrame();

}

function InitLaserSystem()
{
    laserDipatcher = Spawn(class'LaserSecurityDispatcher');
    //laserDipatcher.targetTag = 'LaserMovers';
    //laserDipatcher.ToggleOn();
}

// ----------------------------------------------------------------------
// PreTravel()
//
// Set flags upon exit of a certain map
// ----------------------------------------------------------------------
function PreTravel()
{


    Super.PreTravel();

}

// ----------------------------------------------------------------------
// Timer()
//
// Main state machine for the mission
// ----------------------------------------------------------------------
function Timer() {
  local Mover mv;
  local DamageLaserTrigger A;
  local SecurityCamera Cam;

  if (!bFirstFrame)
  {
      InitLaserSystem();
      bFirstFrame = true;
  }

  if ( (player != None))
  {

        if(flags.GetBool('laserSecurityWorks') == true)
        {
           if ( !bLasersOn )
           {
              foreach AllActors(class'DamageLaserTrigger', A)
              {
                 //A.UnTrigger(None, None);
                 A.Trigger(None, None);
              }
              if (laserDipatcher!=None){
                  laserDipatcher.ToggleOn();

                  foreach AllActors(class'SecurityCamera', Cam)
				  {
				      if (Cam.Tag == 'SCam1' && !Cam.bActive)
			          {
                          player.ToggleCameraState(cam, none);
                          player.ClientMessage("cam+");
			          }
				  }

                  player.ClientMessage("TogleOn включил");
              }

              bLasersOn = true;
           }
           bLasersOff = false;
        }
        else
        {
           if ( !bLasersOff )
           {
              foreach AllActors(class'DamageLaserTrigger', A)
              {
                 A.UnTrigger(None, None);
              }
              if (laserDipatcher!=None)
              {
                  laserDipatcher.ToggleOff();

                   foreach AllActors(class'SecurityCamera', Cam)
			       {
			       		if (Cam.Tag == 'SCam1' && Cam.bActive)
			       		{
                            player.ToggleCameraState(cam, none);
			   	   	   		player.ClientMessage("cam-");
			       		}
			       }

               	   player.ClientMessage("TogleOff выключил");
              }

              bLasersOff = true;
           }
           bLasersOn = false;
        }
  }



  Super.Timer();
  //foreach AllActors(class'Mover', mv) {

}

defaultproperties
{
     CamTag='
}
