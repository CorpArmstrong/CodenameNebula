//-----------------------------------------------------------
//
//-----------------------------------------------------------
class AllModels expands Object;

//
// CageLight
//
#exec MESH IMPORT MESH=CLight ANIVFILE=Models\CLight_a.3d DATAFILE=Models\CLight_d.3d ZEROTEX=1
#exec MESH ORIGIN MESH=CLight X=0 Y=0 Z=0 YAW=64
//#exec MESHMAP SCALE MESHMAP=CLight X=0.00390625 Y=0.00390625 Z=0.00390625 // original
#exec MESHMAP SCALE MESHMAP=CLight X=1.0 Y=1.0 Z=1.0 // after WOTGreal exporter and unr2de.exe
#exec MESH SEQUENCE MESH=CLight SEQ=All		STARTFRAME=0	NUMFRAMES=1
#exec MESH SEQUENCE MESH=CLight SEQ=Still	STARTFRAME=0	NUMFRAMES=1

#exec Texture Import Name=NCL_White File=Textures\NotCageLightW.pcx GROUP="Skins" Flags=2
#exec Texture Import Name=NCL_Red   File=Textures\NotCageLightR.pcx GROUP="Skins" Flags=2
#exec Texture Import Name=NCL_Green File=Textures\NotCageLightG.pcx GROUP="Skins" Flags=2

//#exec TEXTURE IMPORT NAME=CageLightTex1 FILE=Models\CageLight.pcx GROUP="Skins" FLAGS=2
//#exec TEXTURE IMPORT NAME=CageLightTex2 FILE=Models\CageLight1.pcx GROUP="Skins" FLAGS=2
//#exec TEXTURE IMPORT NAME=CageLightTex3 FILE=Models\CageLight2.pcx GROUP="Skins" FLAGS=2
//#exec TEXTURE IMPORT NAME=CageLightTex4 FILE=Models\CageLight3.pcx GROUP="Skins" FLAGS=2
//#exec TEXTURE IMPORT NAME=CageLightTex5 FILE=Models\CageLight4.pcx GROUP="Skins" FLAGS=2
//#exec TEXTURE IMPORT NAME=CageLightTex6 FILE=Models\CageLight5.pcx GROUP="Skins" FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=CLight NUM=0 TEXTURE=NCL_White

DefaultProperties
{

}
