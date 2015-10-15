// ============================================================================
// ScreenUIPageNetwork
// Copyright 2001 by Mychaeel <mychaeel@planetunreal.com>
//
// Content of Network tab in Screen user interface.
// ============================================================================


class ScreenUIPageNetwork extends UWindowPageWindow;


// ============================================================================
// Controls
// ============================================================================

var UWindowLabelControl LabelTitle;
var UWindowLabelControl LabelDescription1;
var UWindowLabelControl LabelDescription2;
var UWindowLabelControl LabelDescription3;
var UWindowLabelControl LabelDescription4;
var UWindowComboControl ComboNetwork;


// ============================================================================
// Created
// ============================================================================

function Created() { 

  LabelTitle = UWindowLabelControl(CreateControl(class 'UWindowLabelControl', 20, 17, WinWidth - 40, 1));
  LabelTitle.SetText("Network Access");
  LabelTitle.SetFont(F_Bold);

  ComboNetwork = UWindowComboControl(CreateControl(class 'UWindowComboControl', 20, 43, WinWidth - 40, 1));
  ComboNetwork.SetText("Live Content Downloads");
  ComboNetwork.AddItem("Full Access");
  ComboNetwork.AddItem("Restricted Access");
  ComboNetwork.AddItem("No Access");
  ComboNetwork.SetEditable(false);
  ComboNetwork.SetSelectedIndex(int(class 'Screen'.default.Network));

  LabelDescription1 = UWindowLabelControl(CreateControl(class 'UWindowLabelControl', 20,  74, WinWidth - 40, 1));
  LabelDescription2 = UWindowLabelControl(CreateControl(class 'UWindowLabelControl', 20,  86, WinWidth - 40, 1));
  LabelDescription3 = UWindowLabelControl(CreateControl(class 'UWindowLabelControl', 20,  98, WinWidth - 40, 1));
  LabelDescription4 = UWindowLabelControl(CreateControl(class 'UWindowLabelControl', 20, 110, WinWidth - 40, 1));

  SetDescription();
  }


// ============================================================================
// SetDescription
//
// Sets the description text for the currently selected network access option.
// ============================================================================

function SetDescription() {

  if (LabelDescription1 == None)
    return;

  switch (ComboNetwork.GetSelectedIndex()) {
    case 0:
      LabelDescription1.SetText("Grants live-feed screens permission to download live");
      LabelDescription2.SetText("content from the Internet even in single player mode.");
      LabelDescription3.SetText("Live-feed screens usually voluntarily restrict themselves");
      LabelDescription4.SetText("to network games.");
      break;
      
    case 1:
      LabelDescription1.SetText("Restricts all Internet access of live-feed screens to");
      LabelDescription2.SetText("network games (when you join a network game or run");
      LabelDescription3.SetText("a listen server) even if they request otherwise.");
      LabelDescription4.SetText("");
      break;

    case 2:
      LabelDescription1.SetText("Prevents all live content downloads by live-feed screens.");
      LabelDescription2.SetText("Not recommended.");
      LabelDescription3.SetText("");
      LabelDescription4.SetText("");
      break;
    }
  }


// ============================================================================
// Notify
// ============================================================================

function Notify(UWindowDialogControl Control, byte ControlEvent) {

  switch (Control) {
    case ComboNetwork:
      if (ControlEvent == DE_Change)
        SetDescription();
      break;
    }
  }


// ============================================================================
// Close
// ============================================================================

function Close(optional bool ByParent) {   

  switch (ComboNetwork.GetSelectedIndex()) {
    case 0: class 'Screen'.default.Network = ConfigNetwork_Always;  break;
    case 1: class 'Screen'.default.Network = ConfigNetwork_Network; break;
    case 2: class 'Screen'.default.Network = ConfigNetwork_Never;   break;
    }

  class 'Screen'.static.StaticSaveConfig();

  Super.Close(ByParent);
  }
defaultproperties
{
}
