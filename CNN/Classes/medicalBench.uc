// Generated by MeshMaker (c) 2001 by Mychaeel <mychaeel@planetunreal.com>

class medicalBench extends Decoration;

#exec obj load file=..\Textures\HK_MJ12Lab.utx package=HK_MJ12Lab
#exec obj load file=..\Textures\CoreTexGlass.utx package=CoreTexGlass
#exec obj load file=..\Textures\CoreTexMetal.utx package=CoreTexMetal

#exec mesh import mesh=medicalBench anivfile=Models\medicalBench_a.3d datafile=Models\medicalBench_d.3d x=0 y=0 z=0 mlod=0
#exec mesh origin mesh=medicalBench x=0 y=0 z=0
#exec mesh sequence mesh=medicalBench seq=All startframe=0 numframes=1

#exec meshmap new meshmap=medicalBench mesh=medicalBench
#exec meshmap scale meshmap=medicalBench x=0.11719 y=0.11719 z=0.11719

defaultproperties
{
  DrawType=DT_Mesh
  Mesh=Mesh'medicalBench'
  bCollideWhenPlacing=True
  CollisionRadius=59.99983
  CollisionHeight=25.00000
  MultiSkins(0)=Texture'HK_MJ12Lab.Metal.HK_strwal_03'
  MultiSkins(1)=Texture'HK_MJ12Lab.Metal.HK_strwal_02'
  MultiSkins(2)=Texture'CoreTexGlass.Glass.PrivBlueGlass_A'
  MultiSkins(3)=Texture'CoreTexMetal.Metal.ShipGrayMetal_A'
}
