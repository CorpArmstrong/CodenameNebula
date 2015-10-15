// ============================================================================
// ScreenUIClientWindow
// Copyright 2001 by Mychaeel <mychaeel@planetunreal.com>
//
// Dialog box content for Screen user interface.
// ============================================================================


class ScreenUIClientWindow extends UWindowDialogClientWindow;


// ============================================================================
// Controls
// ============================================================================

var UWindowPageControl Pages;
var UWindowSmallCloseButton ButtonClose;
var UWindowTabControlItem PageNetwork;
var UWindowTabControlItem PageAbout;


// ============================================================================
// Created
// ============================================================================

function Created() {
  
  WinWidth += 4;
  
  Pages = UWindowPageControl(CreateWindow(class 'UWindowPageControl', 0, 0, WinWidth, WinHeight - 24));
  Pages.SetMultiLine(true);
  
  PageNetwork = Pages.AddPage("Network", class 'ScreenUIScrollClientNetwork');
  PageAbout   = Pages.AddPage("About",   class 'ScreenUIScrollClientAbout');

  if (class 'Screen'.default.VersionLatest > class 'Screen'.default.Version) {
    PageAbout.SetCaption("Update");
    PageAbout.bFlash = true;
    }

  ButtonClose = UWindowSmallCloseButton(CreateControl(class 'UWindowSmallCloseButton', WinWidth - 53, WinHeight - 21, 48, 16));

  Super.Created();
  }


// ============================================================================
// Paint
// ============================================================================

function Paint(Canvas CanvasBackground, float X, float Y) {

  local Texture TextureBackground;

  TextureBackground = GetLookAndFeelTexture();
  DrawUpBevel(CanvasBackground, 0, 0, WinWidth, WinHeight, TextureBackground);
  }
defaultproperties
{
}
