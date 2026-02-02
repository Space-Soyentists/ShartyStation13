/**
 *
 * the nusoi gui
 *
 * the one that will take over the nusoiworld
 */

SUBSYSTEM_DEF(ngui)
	name = "ngui"
	wait = 9
	flags = SS_NO_INIT
	runlevels = RUNLEVEL_LOBBY | RUNLEVELS_DEFAULT

/datum/controller/subsystem/ngui/PreInit()
	world.log << "the nusoi gui\n the one that will btfo the nusoiworld"
	for (var/client/C in GLOB.clients)
		to_chat(C, "I'm a nusoi in this nusoi world and you are too")

