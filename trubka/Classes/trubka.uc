// Generated by MeshMaker (c) 2001 by Mychaeel <mychaeel@planetunreal.com>

class trubka extends Decoration;

#exec obj load file=..\Textures\CoreTexMetal.utx package=CoreTexMetal

#exec mesh import mesh=trubka anivfile=Models\trubka_a.3d datafile=Models\trubka_d.3d x=0 y=0 z=0 mlod=0
#exec mesh origin mesh=trubka x=0 y=0 z=0
#exec mesh sequence mesh=trubka seq=All startframe=0 numframes=1

#exec meshmap new meshmap=trubka mesh=trubka
#exec meshmap scale meshmap=trubka x=0.2771 y=0.2771 z=0.5542

defaultproperties
{
  DrawType=DT_Mesh
  Mesh=Mesh'trubka'
  bCollideWhenPlacing=True
  bCollideActors=True
  bCollideWorld=True
  bBlockActors=True
  bBlockPlayers=True
  CollisionRadius=4.00113
  CollisionHeight=7.09418
  MultiSkins(0)=Texture'CoreTexMetal.Metal.CT_RdRstMtl_01'
}