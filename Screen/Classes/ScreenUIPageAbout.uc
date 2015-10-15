// ============================================================================
// ScreenUIPageAbout
// Copyright 2001 by Mychaeel <mychaeel@planetunreal.com>
//
// Content of About tab in Screen user interface.
// ============================================================================


class ScreenUIPageAbout extends UWindowPageWindow;


// ============================================================================
// Controls
// ============================================================================

var UWindowLabelControl LabelTitle;
var UWindowLabelControl LabelPermissions;
var UWindowLabelControl LabelSuggestions;
var UWindowLabelControl LabelCopyright;
var UWindowLabelControl LabelMail;
var UWindowSmallButton ButtonWebsite;


// ============================================================================
// Created
// ============================================================================

function Created() { 

  LabelTitle = UWindowLabelControl(CreateControl(class 'UWindowLabelControl', 20, 17, WinWidth - 40, 1));
  LabelTitle.SetText("Screen Component" @ class 'Screen'.default.Version);
  LabelTitle.SetFont(F_Bold);

  LabelPermissions = UWindowLabelControl(CreateControl(class 'UWindowLabelControl', 20, 44, WinWidth - 40, 1));
  LabelPermissions.SetText("Free for noncommercial use and distribution.");

  LabelSuggestions = UWindowLabelControl(CreateControl(class 'UWindowLabelControl', 20, 56, WinWidth - 40, 1));
  LabelSuggestions.SetText("Feedback, bug reports and suggestions are welcome.");

  LabelCopyright = UWindowLabelControl(CreateControl(class 'UWindowLabelControl', 20, 83, WinWidth - 40, 1));
  LabelCopyright.SetText("Copyright 2001 by Mychaeel, mychaeel@planetunreal.com");

  ButtonWebsite = UWindowSmallButton(CreateControl(class 'UWindowSmallButton', 20, 123, 140, 1));
  ButtonWebsite.SetText("Visit the Screen Website");
  
  if (class 'Screen'.default.VersionLatest > class 'Screen'.default.Version)
    ButtonWebsite.SetText("Update Screen Component");
  }


// ============================================================================
// WindowShown
// ============================================================================

function WindowShown() {

  Super.WindowShown();
  
  UWindowPageWindow(ParentWindow).OwnerTab.bFlash = false;
  }


// ============================================================================
// Notify
// ============================================================================

function Notify(UWindowDialogControl Control, byte ControlEvent) {

  switch (Control) {
    case ButtonWebsite:
      if (ControlEvent == DE_Click)
        if (class 'Screen'.default.VersionLatest > class 'Screen'.default.Version)
          GetPlayerOwner().ConsoleCommand("start http://www.planetunreal.com/screen/download.html");
        else
          GetPlayerOwner().ConsoleCommand("start http://www.planetunreal.com/screen/");

      break;
    }
  }
defaultproperties
{
}
