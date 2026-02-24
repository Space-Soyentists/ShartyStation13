/datum/species/nophono
	name = "Nophono"
	id = SPECIES_NOPHONO
	examine_limb_id = SPECIES_NOPHONO
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE
	inherent_traits = list(
		TRAIT_NO_DNA_COPY,
		TRAIT_NOBREATH,
		TRAIT_RADIMMUNE,
		TRAIT_VIRUSIMMUNE,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_NOHUNGER,
		TRAIT_TRUE_NIGHT_VISION,
		TRAIT_THERMAL_VISION
	)

	// mutantheart = /obj/item/organ/internal/heart/nophono
	// mutantbrain = /obj/item/organ/internal/nophono
	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/nophono,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/nophono,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/nophono,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/nophono,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/nophono,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/nophono,
	)

/datum/species/nophono/update_species_heights(mob/living/carbon/human/holder)
	return HUMAN_HEIGHT_TALLEST

/datum/species/nophono/check_roundstart_eligible()
	return FALSE
