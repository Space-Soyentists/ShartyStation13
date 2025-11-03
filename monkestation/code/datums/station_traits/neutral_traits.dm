/datum/station_trait/announcement_doll
	name = "Announcement Doll"
	trait_type = STATION_TRAIT_NEUTRAL
	weight = 10
	show_in_report = TRUE
	report_message = "Doll himself is your announcer today."
	blacklist = list(/datum/station_trait/announcement_medbot,
	/datum/station_trait/announcement_intern,
	/datum/station_trait/announcement_jew
	)

/datum/station_trait/announcement_doll/New()
	. = ..()
	SSstation.announcer = /datum/centcom_announcer/doll

/datum/station_trait/announcement_jew
	name = "Announcement Jew"
	trait_type = STATION_TRAIT_NEUTRAL
	weight = 10
	show_in_report = TRUE
	report_message = "Shalom, I bestow upon you my presence, goyim."
	blacklist = list(/datum/station_trait/announcement_medbot,
	/datum/station_trait/announcement_intern,
	/datum/station_trait/announcement_doll
	)

/datum/station_trait/announcement_jew/New()
	. = ..()
	SSstation.announcer = /datum/centcom_announcer/jew
