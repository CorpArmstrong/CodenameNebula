//-----------------------------------------------------------
//
//-----------------------------------------------------------
class ApocalypseInsideMenuSelectDifficulty expands MenuSelectDifficulty;

// ----------------------------------------------------------------------
// InvokeNewGameScreen()
// ----------------------------------------------------------------------

function InvokeNewGameScreen(float difficulty)
{
    // local ApocalypseInsideMenuScreenNewGame newGame;
	local MenuScreenNewGame newGame;

    // newGame = ApocalypseInsideMenuScreenNewGame(root.InvokeMenuScreen(Class'ApocalypseInsideMenuScreenNewGame'));
	newGame = MenuScreenNewGame(root.InvokeMenuScreen(Class'MenuScreenNewGame'));

	if (newGame != None)
		newGame.SetDifficulty(difficulty);
}

DefaultProperties
{

}
