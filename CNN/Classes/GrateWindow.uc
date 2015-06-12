//=============================================================================
// gratewindow.
//=============================================================================
class gratewindow expands Decoration;

#forceexec MESH IMPORT MESH=gratewindow ANIVFILE=Models\gratewindow_a.3d DATAFILE=Models\gratewindow_d.3d ZEROTEX=1

#forceexec MESH SEQUENCE MESH=gratewindow      SEQ=All              STARTFRAME=0   NUMFRAMES=1
#forceexec MESH SEQUENCE MESH=gratewindow      SEQ=Still            STARTFRAME=0   NUMFRAMES=1

#forceexec MESHMAP SCALE MESHMAP=gratewindow X=0.00390625 Y=0.00390625 Z=0.00390625
#forceexec TEXTURE IMPORT NAME=gratewindowTex0  FILE=Models\gratewindowTex0.pcx GROUP=Skins
#forceexec MESHMAP SETTEXTURE MESHMAP=gratewindow NUM=0  TEXTURE=gratewindowTex0

defaultproperties
{
	bStatic=False
	Class=CNN.gratewindow
	Mesh=CNN.gratewindow
	DrawType=DT_Mesh
	CollisionHeight=+00077.015625
	CollisionRadius=+00126.703125
}
