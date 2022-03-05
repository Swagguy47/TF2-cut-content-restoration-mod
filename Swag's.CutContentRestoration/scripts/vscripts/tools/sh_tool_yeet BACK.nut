
global function Toolgun_RegisterTool_yeet

//Extra little fun thing, throws npcs when shot. Very basic stuff

table yeet = {};

void function Toolgun_RegisterTool_yeet()
{
	#if SERVER
		swag_npc = "npc_soldier"
	#endif
	
	#if CLIENT
		swag_npc = "npc_soldier"
	#endif
	
	// Create the tool
	yeet.id <- "swag_npc";

	yeet.GetName <- function()
	{
		return "NPC Yeet";
	}

	yeet.GetHelp <- function()
	{
		string help = "Select an NPC to send to the stratosphere!";
		return help;
	}

	yeet.RegisterOptions <- function()
	{
		#if CLIENT
		AddTextOption( "npc", "NPC" );
		AddButtonOption( "swag_npc", "npc_soldier", "Grunt" );
		AddButtonOption( "swag_npc", "npc_spectre", "Spectre" );
		AddButtonOption( "swag_npc", "npc_pilot_elite", "Pilot" );
		AddButtonOption( "swag_npc", "npc_marvin", "Marvin" );
		AddButtonOption( "swag_npc", "npc_frag_drone", "Tick" );
		AddButtonOption( "swag_npc", "npc_super_spectre", "Reaper" );
		AddButtonOption( "swag_npc", "npc_prowler", "Prowler" );
		AddButtonOption( "swag_npc", "npc_stalker", "Stalker" );
		AddButtonOption( "swag_npc", "npc_titan", "Titan" );
		#endif
	}

	yeet.OnFire <- function()
	{
	#if SERVER
		entity Player = GetPlayerByIndex( 0 );
		
		ClientCommand( Player, "ent_fire " + swag_npc ); //Fingers crossed
	#endif
	}

	// Register the tool
	ToolGunTools.append( yeet );

}