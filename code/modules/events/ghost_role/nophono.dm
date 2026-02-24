/datum/round_event_control/nophono
	name = "nophono"
	typepath = /datum/round_event/ghost_role/nophono
	weight = 14
	max_occurrences = 1
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMBAT, TAG_OUTSIDER_ANTAG)
	checks_antag_cap = TRUE
	dont_spawn_near_roundend = TRUE


/datum/round_event/ghost_role/nophono
	minimum_required = 1
	role_name = "Nophono"
	fakeable = FALSE

/datum/round_event/ghost_role/nophono/spawn_role()
	var/list/candidates = SSpolling.poll_ghost_candidates(
		question = "Do you want to play as Nophono?",
		role = ROLE_NOPHONO,
		check_jobban = ROLE_NOPHONO,
		poll_time = 20 SECONDS,
		alert_pic = /datum/antagonist/nophono,
		role_name_text = "nophono"
	)
	var/turf/spawn_loc = find_safe_turf_in_maintenance()

	if (!length(candidates))
		return NOT_ENOUGH_PLAYERS

	var/mob/dead/selected = pick_n_take(candidates)
	var/mob/living/carbon/human/nophono = new(spawn_loc)

	nophono.dna.update_dna_identity()
	var/datum/mind/Mind = new /datum/mind(selected.key)
	Mind.special_role = "Nophono"
	Mind.active = 1
	Mind.transfer_to(nophono)
	Mind.add_antag_datum(/datum/antagonist/nophono)

	message_admins("[ADMIN_LOOKUPFLW(nophono)] has been made into Nophono.")
	log_game("[key_name(nophono)] was spawned as Nophono by an event.")
	spawned_mobs += nophono
	return SUCCESSFUL_SPAWN
