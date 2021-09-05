
untyped

global function InitPathChooserDialog_Swag
global function OpenPathChooserDialog_Swag

struct {
	var menu
	var bgRui

	int choiceIndex

	bool openRequested
} file

void function InitPathChooserDialog_Swag()
{
	file.menu = GetMenu( "PathChooserDialog" )

	uiGlobal.menuData[file.menu].isDialog = true

	file.bgRui = Hud_GetRui( Hud_GetChild( file.menu, "DialogFrame" ) )

	AddMenuEventHandler( file.menu, eUIEvent.MENU_OPEN, OnDialog_Open_Swag )
	AddMenuEventHandler( file.menu, eUIEvent.MENU_CLOSE, OnDialog_Close_Swag )

	thread PathChooserOpenWaitThread_Swag()
}

void function PathChooserOpenWaitThread_Swag()
{
	while( true )
	{
		if ( file.openRequested )
		{
			file.openRequested = false
			OpenPathChooserDialog_ForReal_Swag()
		}
		WaitFrame()
	}
}

void function OnDialog_Open_Swag()
{
	//
	{
		RuiSetString( file.bgRui, "headerText", Localize( "#PATHCHOOSER_HEADER" ) )

		RuiSetImage( file.bgRui, "banner0", $"rui/callsigns/callsign_13_col" )
		RuiSetString( file.bgRui, "promptText0", Localize( "#PATHCHOOSER_PROMPT0" ) )
		RuiSetString( file.bgRui, "iconTextGP0", "%left%" )
		RuiSetString( file.bgRui, "iconTextKB0", "[`11`0]" )
		RuiSetBool( file.bgRui, "isLocked0", false )

		RuiSetImage( file.bgRui, "banner1", $"rui/menu/boosts/boost_phase_rewind" )
		RuiSetString( file.bgRui, "promptText1", Localize( "#PATHCHOOSER_PROMPT1" ) )
		RuiSetString( file.bgRui, "iconTextGP1", "%down%" )
		RuiSetString( file.bgRui, "iconTextKB1", "[`12`0]" )
		RuiSetBool( file.bgRui, "isLocked1", false )

		RuiSetImage( file.bgRui, "banner2", $"rui/callsigns/callsign_14_col" )
		RuiSetString( file.bgRui, "promptText2", Localize( "#PATHCHOOSER_PROMPT2" ) )
		RuiSetString( file.bgRui, "iconTextGP2", "%right%" )
		RuiSetString( file.bgRui, "iconTextKB2", "[`13`0]" )
		RuiSetBool( file.bgRui, "isLocked2", false )

		RuiSetImage( file.bgRui, "banner3", $"rui/callsigns/callsign_86_col" )
		RuiSetString( file.bgRui, "promptText3", Localize( "#PATHCHOOSER_PROMPT3" ) )
		RuiSetString( file.bgRui, "iconTextGP3", "%A_BUTTON%" )
		RuiSetString( file.bgRui, "iconTextKB3", "[`14`0]" )
		RuiSetBool( file.bgRui, "isLocked3", true )

		RuiSetImage( file.bgRui, "banner4", $"rui/callsigns/callsign_38_col" )
		RuiSetString( file.bgRui, "promptText4", Localize( "#PATHCHOOSER_PROMPT4" ) )
		RuiSetString( file.bgRui, "iconTextGP4", "%X_BUTTON%" )
		RuiSetString( file.bgRui, "iconTextKB4", "[`15`0]" )
		RuiSetBool( file.bgRui, "isLocked4", true )

		RuiSetImage( file.bgRui, "banner5", $"rui/callsigns/callsign_89_col" )
		RuiSetString( file.bgRui, "promptText5", Localize( "#PATHCHOOSER_PROMPT5" ) )
		RuiSetString( file.bgRui, "iconTextGP5", "%Y_BUTTON%" )
		RuiSetString( file.bgRui, "iconTextKB5", "[`16`0]" )
		RuiSetBool( file.bgRui, "isLocked5", true )

		RuiSetGameTime( file.bgRui, "initTime", Time() )
		RuiSetInt( file.bgRui, "choiceIndex", -1 )
	}

	file.choiceIndex = -1

	UpdateFooterOptions()

	RegisterButtonPresses_Swag()
}

void function OpenPathChooserDialog_ForReal_Swag()
{
	var activeMenu = GetActiveMenu()
	if ( activeMenu != null )
		return

	AdvanceMenu( GetMenu( "PathChooserDialog" ) )
}

void function OpenPathChooserDialog_Swag()
{
	file.openRequested = true
}

void function OnDialog_Close_Swag()
{
	DeregisterButtonPresses_Swag()

	if ( file.choiceIndex >= 0 )
	{
		string cmdText = ("choosepath " + file.choiceIndex)
		ClientCommand( cmdText )
	}
}

void function CloseAfterDelay_Swag()
{
	wait( 0.0 )

	if ( !IsMenuInMenuStack( file.menu ) )
		return

	CloseAllDialogs()
}

void function RegisterButtonPresses_Swag()
{
	RegisterButtonPressedCallback( BUTTON_DPAD_LEFT, Answer0_Swag )
	RegisterButtonPressedCallback( BUTTON_DPAD_DOWN, Answer1_Swag )
	RegisterButtonPressedCallback( BUTTON_DPAD_RIGHT, Answer2_Swag )
	RegisterButtonPressedCallback( BUTTON_A, Answer3_Swag )
	RegisterButtonPressedCallback( BUTTON_X, Answer4_Swag )
	RegisterButtonPressedCallback( BUTTON_Y, Answer5_Swag )

	RegisterButtonPressedCallback( KEY_1, Answer0_Swag )
	RegisterButtonPressedCallback( KEY_2, Answer1_Swag )
	RegisterButtonPressedCallback( KEY_3, Answer2_Swag )
	RegisterButtonPressedCallback( KEY_4, Answer3_Swag )
	RegisterButtonPressedCallback( KEY_5, Answer4_Swag )
	RegisterButtonPressedCallback( KEY_6, Answer5_Swag )
}

void function DeregisterButtonPresses_Swag()
{
	DeregisterButtonPressedCallback( BUTTON_DPAD_LEFT, Answer0_Swag )
	DeregisterButtonPressedCallback( BUTTON_DPAD_DOWN, Answer1_Swag )
	DeregisterButtonPressedCallback( BUTTON_DPAD_RIGHT, Answer2_Swag )
	DeregisterButtonPressedCallback( BUTTON_A, Answer3_Swag )
	DeregisterButtonPressedCallback( BUTTON_X, Answer4_Swag )
	DeregisterButtonPressedCallback( BUTTON_Y, Answer5_Swag )

	DeregisterButtonPressedCallback( KEY_1, Answer0_Swag )
	DeregisterButtonPressedCallback( KEY_2, Answer1_Swag )
	DeregisterButtonPressedCallback( KEY_3, Answer2_Swag )
	DeregisterButtonPressedCallback( KEY_4, Answer3_Swag )
	DeregisterButtonPressedCallback( KEY_5, Answer4_Swag )
	DeregisterButtonPressedCallback( KEY_6, Answer5_Swag )
}

void function MadeChoice_Swag( int choiceIndexRaw )
{
	int choiceIndex
	switch( choiceIndexRaw )
	{
		case 0:
		case 1:
		case 2:
			choiceIndex = choiceIndexRaw
			break
		case 3:
		case 4:
		case 5:
		default:
			choiceIndex = -1
			break
	}

	if ( choiceIndex < 0 )
	{
		EmitUISound( "coop_sentrygun_deploymentdeniedbeep" )
		return
	}

	if ( file.choiceIndex >= 0 )
		return

	file.choiceIndex = choiceIndex

	RuiSetInt( file.bgRui, "choiceIndex", choiceIndex )
	RuiSetGameTime( file.bgRui, "choiceTime", Time() )

	EmitUISound( "menu_loadout_ordinance_select" )
	thread CloseAfterDelay_Swag()
}

void function Answer0_Swag( var button )
{
	MadeChoice_Swag( 0 )
}

void function Answer1_Swag( var button )
{
	MadeChoice_Swag( 1 )
}

void function Answer2_Swag( var button )
{
	MadeChoice_Swag( 2 )
}

void function Answer3_Swag( var button )
{
	MadeChoice_Swag( 3 )
}

void function Answer4_Swag( var button )
{
	MadeChoice_Swag( 4 )
}

void function Answer5_Swag( var button )
{
	MadeChoice_Swag( 5 )
}


