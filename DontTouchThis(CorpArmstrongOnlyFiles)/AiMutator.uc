//-----------------------------------------------------------
//
//-----------------------------------------------------------
class AiMutator expands Info
	native;

var	AiMutator CNextMutator;
var AiMutator CNextDamageMutator;
var AiMutator CNextMessageMutator;
var AiMutator CNextHUDMutator;

var bool bHUDMutator;

var class<Weapon> DefaultWeapon;

event PreBeginPlay()
{
	//Don't call Actor PreBeginPlay()
}

simulated event PostRender( canvas Canvas );

function ModifyPlayer(Pawn Other)
{
	// called by GameInfo.RestartPlayer()
	if ( CNextMutator != None )
		CNextMutator.ModifyPlayer(Other);
}

function bool HandleRestartGame()
{
	if ( CNextMutator != None )
		return CNextMutator.HandleRestartGame();
	return false;
}

function bool HandleEndGame()
{
	// called by GameInfo.RestartPlayer()
	if ( CNextMutator != None )
		return CNextMutator.HandleEndGame();
	return false;
}

function bool HandlePickupQuery(Pawn Other, Inventory item, out byte bAllowPickup)
{
	if ( CNextMutator != None )
		return CNextMutator.HandlePickupQuery(Other, item, bAllowPickup);
	return false;
}

function bool PreventDeath(Pawn Killed, Pawn Killer, name damageType, vector HitLocation)
{
	if ( CNextMutator != None )
		return CNextMutator.PreventDeath(Killed,Killer, damageType,HitLocation);
	return false;
}

function ModifyLogin(out class<playerpawn> SpawnClass, out string Portal, out string Options)
{
	if ( CNextMutator != None )
		CNextMutator.ModifyLogin(SpawnClass, Portal, Options);
}

function ScoreKill(Pawn Killer, Pawn Other)
{
	// called by GameInfo.ScoreKill()
	if ( CNextMutator != None )
		CNextMutator.ScoreKill(Killer, Other);
}

// return what should replace the default weapon
// mutators further down the list override earlier mutators
function Class<Weapon> MutatedDefaultWeapon()
{
	local Class<Weapon> W;

	if ( CNextMutator != None )
	{
		W = CNextMutator.MutatedDefaultWeapon();
		if ( W == Level.Game.DefaultWeapon )
			W = MyDefaultWeapon();
	}
	else
		W = MyDefaultWeapon();
	return W;
}

function Class<Weapon> MyDefaultWeapon()
{
	if ( DefaultWeapon != None )
		return DefaultWeapon;
	else
		return Level.Game.DefaultWeapon;
}

function AddMutator(AiMutator M)
{
	if ( CNextMutator == None )
		CNextMutator = M;
	else
		CNextMutator.AddMutator(M);
}

/* ReplaceWith()
Call this function to replace an actor Other with an actor of aClass.
*/
function bool ReplaceWith(actor Other, string aClassName)
{
	local Actor A;
	local class<Actor> aClass;

	if ( Other.IsA('Inventory') && (Other.Location == vect(0,0,0)) )
		return false;
	aClass = class<Actor>(DynamicLoadObject(aClassName, class'Class'));
	if ( aClass != None )
		A = Spawn(aClass,Other.Owner,Other.tag,Other.Location, Other.Rotation);
	if ( Other.IsA('Inventory') )
	{
		if ( Inventory(Other).MyMarker != None )
		{
			Inventory(Other).MyMarker.markedItem = Inventory(A);
			if ( Inventory(A) != None )
			{
				Inventory(A).MyMarker = Inventory(Other).MyMarker;
				A.SetLocation(A.Location
					+ (A.CollisionHeight - Other.CollisionHeight) * vect(0,0,1));
			}
			Inventory(Other).MyMarker = None;
		}
		else if ( A.IsA('Inventory') )
		{
			Inventory(A).bHeldItem = true;
			Inventory(A).Respawntime = 0.0;
		}
	}
	if ( A != None )
	{
		A.event = Other.event;
		A.tag = Other.tag;
		return true;
	}
	return false;
}

/* Force game to always keep this actor, even if other mutators want to get rid of it
*/
function bool AlwaysKeep(Actor Other)
{
	if ( CNextMutator != None )
		return ( CNextMutator.AlwaysKeep(Other) );
	return false;
}

function bool IsRelevant(Actor Other, out byte bSuperRelevant)
{
	local bool bResult;

	// allow mutators to remove actors
	bResult = CheckReplacement(Other, bSuperRelevant);
	if ( bResult && (CNextMutator != None) )
		bResult = CNextMutator.IsRelevant(Other, bSuperRelevant);

	return bResult;
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	return true;
}

function Mutate(string MutateString, PlayerPawn Sender)
{
	if ( CNextMutator != None )
		CNextMutator.Mutate(MutateString, Sender);
}

function MutatorTakeDamage( out int ActualDamage, Pawn Victim, Pawn InstigatedBy, out Vector HitLocation,
						out Vector Momentum, name DamageType)
{
	if ( CNextDamageMutator != None )
		CNextDamageMutator.MutatorTakeDamage( ActualDamage, Victim, InstigatedBy, HitLocation, Momentum, DamageType );
}

function bool MutatorTeamMessage( Actor Sender, Pawn Receiver, PlayerReplicationInfo PRI, coerce string S, name Type, optional bool bBeep )
{
	if ( CNextMessageMutator != None )
		return CNextMessageMutator.MutatorTeamMessage( Sender, Receiver, PRI, S, Type, bBeep );
	else
		return true;
}

function bool MutatorBroadcastMessage( Actor Sender, Pawn Receiver, out coerce string Msg, optional bool bBeep, out optional name Type )
{
	if ( CNextMessageMutator != None )
		return CNextMessageMutator.MutatorBroadcastMessage( Sender, Receiver, Msg, bBeep, Type );
	else
		return true;
}

function bool MutatorBroadcastLocalizedMessage( Actor Sender, Pawn Receiver, out class<LocalMessage> Message, out optional int Switch, out optional PlayerReplicationInfo RelatedPRI_1, out optional PlayerReplicationInfo RelatedPRI_2, out optional Object OptionalObject )
{
	if ( CNextMessageMutator != None )
		return CNextMessageMutator.MutatorBroadcastLocalizedMessage( Sender, Receiver, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject );
	else
		return true;
}

// FIXME: CorpArmstrong
// There is no HUDMutator field in DeusEx's PlayerPawn!
// You probably should subclass PlayerPawn ?

// Registers the current mutator on the client to receive PostRender calls.
simulated function RegisterHUDMutator()
{
	local Pawn P;

	ForEach AllActors(class'Pawn', P)
		if ( P.IsA('PlayerPawn') && (PlayerPawn(P).myHUD != None) )
		{
			//NextHUDMutator = PlayerPawn(P).myHUD.HUDMutator; //PlayerPawn(P).myHud.HUDMutator;
			//PlayerPawn(P).myHUD.HUDMutator = Self;
			bHUDMutator = True;
		}
}

defaultproperties
{
}
