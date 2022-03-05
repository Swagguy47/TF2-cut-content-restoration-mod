
global function Toolgun_RegisterTool_Yeet

//Extra little fun thing, throws npcs when shot. Very basic stuff

table ToolYeet = {};

void function Toolgun_RegisterTool_Yeet()
{
	// Create the tool
	ToolYeet.id <- "npc";

	ToolYeet.GetName <- function()
	{
		return "NPC Yeeter";
	}

	ToolYeet.GetHelp <- function()
	{
		return "Practice your aim with NPC skeet shooting. \n Send an entity into the stratosphere!";
	}
	
	ToolYeet.RegisterOptions <- function()
	{
		#if CLIENT
		AddTextOption( "npc", "NPC" );
		AddButtonOption( "npc", "ent_fire npc_soldier", "Grunt" );
		AddButtonOption( "npc", "ent_fire npc_spectre", "Spectre" );
		AddButtonOption( "npc", "ent_fire npc_pilot_elite", "Pilot" );
		AddButtonOption( "npc", "ent_fire npc_marvin", "Marvin" );
		AddButtonOption( "npc", "ent_fire npc_frag_drone", "Tick" );
		AddButtonOption( "npc", "ent_fire npc_super_spectre", "Reaper" );
		AddButtonOption( "npc", "ent_fire npc_prowler", "Prowler" );
		AddButtonOption( "npc", "ent_fire npc_stalker", "Stalker" );
		AddButtonOption( "npc", "ent_fire npc_titan", "Titan" );
		#endif
	}

	ToolYeet.OnFire <- function()
	{
	#if SERVER
		entity Player = GetPlayerByIndex( 0 );
		ClientCommand( Player, "ent_fire npc_soldier" ); //Fingers crossed
	#endif
	}

	// Register the tool
	ToolGunTools.append( ToolYeet );

}