//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DestroyTrigger expands CNNTrigger;

var () name ScriptedPawnTag;

function Trigger(Actor Other, Pawn Instigator)
{
    local DeusExPlayer player;
    local ScriptedPawn A;
    local DestroyTriggerExpectant Expectant;

// =================================
        player = DeusExPlayer(GetPlayerPawn());

        if (player != none && player.IsInState('Conversation'))
        {
            Expectant = Spawn(class'DestroyTriggerExpectant', none);
            Expectant.ScriptedPawnTag = ScriptedPawnTag;
            Expectant.TurnOn();
        }
        else
            foreach AllActors( class 'ScriptedPawn', A, ScriptedPawnTag )
                A.Destroy();
// =================================
	Super.Trigger(Other, Instigator);
}

function Touch(Actor Other)
{
    local DeusExPlayer player;
    local ScriptedPawn A;
    local DestroyTriggerExpectant Expectant;

	if (IsRelevant(Other))
	{

        player = DeusExPlayer(GetPlayerPawn());

        if (player != none && player.IsInState('Conversation'))
        {
            Expectant = Spawn(class'DestroyTriggerExpectant', none);
            Expectant.ScriptedPawnTag = ScriptedPawnTag;
            Expectant.TurnOn();
        }
        else
            foreach AllActors( class 'ScriptedPawn', A, ScriptedPawnTag )
                A.Destroy();

		Super.Touch(Other);
	}
}

DefaultProperties
{

}
