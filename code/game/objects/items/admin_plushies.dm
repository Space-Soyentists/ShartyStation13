//	This is where all of the MonkeStation Admin Plushies SHOULD be stored

// Plushies
/obj/item/toy/plush/admin
	name = "admin plushie"
	desc = "if you're seeing this there's an issue."
	icon = 'icons/obj/admin_plushies.dmi'
	icon_state = ""
	/// A string of text that is optionaly added to the objects desc, it SHOULD be the admin's CKEY.
	var/adminCKey = null
	// Whether or not to append (A member of our beloved admin team) to the end of the description
	var/append_note = TRUE

/obj/item/toy/plush/admin/Initialize(mapload)
	. = ..()
	if(append_note)
		if(adminCKey)
			desc = "[desc]" + " " + "<i>(A member of our beloved admin team - [adminCKey])</i>"
		else
			desc = "[desc]" + " " + "(A member of our beloved admin team)"

/obj/item/toy/plush/admin/soot
	name = "soot"
	desc = "<i>\"sooby soob\"</i><br>It's Soot, everyone knows Soot!"
	icon_state = "soot"
	attack_verb_continuous = list("administrates", "soots", "creates")
	attack_verb_simple = list("administrate", "soot", "create")
	gender = MALE
	append_note = FALSE
/datum/loadout_item/plushies/soot
	name = "Soot Plush"
	item_path = /obj/item/toy/plush/admin/soot
/datum/store_item/plushies/soot
	name = "Soot Plush"
	item_path = /obj/item/toy/plush/admin/soot
	item_cost = 7500

/obj/item/toy/plush/admin/kuz
	name = "kuz"
	desc = "<i>\"kooby koob\"</i><br>The tag is in Cyrillic. All you can make out is the KolymaNET logo and a word that looks vaguely like 'Kuz'."
	icon_state = "kuz"
	attack_verb_continuous = list("administrates", "kuzes", "kolymas")
	attack_verb_simple = list("administrate", "kuz", "kolyma")
	gender = MALE
	append_note = FALSE
/datum/loadout_item/plushies/kuz
	name = "Kuz Plush"
	item_path = /obj/item/toy/plush/admin/kuz
/datum/store_item/plushies/kuz
	name = "Kuz Plush"
	item_path = /obj/item/toy/plush/admin/kuz
	item_cost = 7500

/obj/item/toy/plush/admin/kuz/defiled
	name = "\"carter\""
	desc = "<i>\"kooby koob...\"</i><br>This plushie looks like it's seen better days. The tag has 'Carter' crudely written over it."
	icon_state = "kuz-defiled"
	stuffed = FALSE
	append_note = FALSE
/datum/loadout_item/plushies/kuz/defiled
	name = "Kuz Plush (Defiled)"
	item_path = /obj/item/toy/plush/admin/kuz/defiled
/datum/store_item/plushies/kuz/defiled
	name = "Kuz Plush (Defiled)"
	item_path = /obj/item/toy/plush/admin/kuz/defiled
	item_cost = 7499
/obj/item/toy/plush/admin/kuz/defiled/plop(obj/item/toy/plush/Daddy) //other plushies can still create carter jrs, fix later?
	return FALSE

/obj/item/toy/plush/admin/doll
	name = "doll"
	desc = "<i>\"dada\"</i><br>The tag has the KolymaNET logo and is labeled 'DOLL'."
	icon_state = "doll"
	attack_verb_continuous = list("administrates", "dolls", "cacas")
	attack_verb_simple = list("administrate", "doll", "caca")
	gender = MALE
	append_note = FALSE
/datum/loadout_item/plushies/doll
	name = "Doll Plush"
	item_path = /obj/item/toy/plush/admin/doll
/datum/store_item/plushies/doll
	name = "Doll Plush"
	item_path = /obj/item/toy/plush/admin/doll
	item_cost = 7500

/obj/item/toy/plush/admin/froot
	name = "froot"
	desc = "<i>\"frooby froob\"</i><br>The tag has the emblem of the FDL and is labeled 'Froot'."
	icon_state = "froot"
	attack_verb_continuous = list("administrates", "froots", "dekuzifies")
	attack_verb_simple = list("administrate", "froot", "dekuzify")
	gender = MALE
	append_note = FALSE
/datum/loadout_item/plushies/froot
	name = "Froot Plush"
	item_path = /obj/item/toy/plush/admin/froot
/datum/store_item/plushies/froot
	name = "Froot Plush"
	item_path = /obj/item/toy/plush/admin/froot
	item_cost = 7500

/obj/item/toy/plush/admin/quote
	name = "quote"
	desc = "<i>\"qooby qoob\"</i><br>The tag has the emblem of the QDL and is labeled 'Quote'."
	icon_state = "quote"
	attack_verb_continuous = list("administrates", "quotes", "nusois")
	attack_verb_simple = list("administrate", "quote", "nusoi")
	gender = MALE
	adminCKey = "SoyQuote"
/datum/loadout_item/plushies/quote
	name = "Quote Plush"
	item_path = /obj/item/toy/plush/admin/quote
/datum/store_item/plushies/quote
	name = "Quote Plush"
	item_path = /obj/item/toy/plush/admin/quote
	item_cost = 7500

/obj/item/toy/plush/admin/lucky
	name = "lucky"
	desc = "<i>\"looky look\"</i><br>The tag has the emblem of the QDL and is labeled 'Lucky'."
	icon_state = "lucky"
	attack_verb_continuous = list("jannies", "luckies", "spaces")
	attack_verb_simple = list("janny", "lucky", "space")
	gender = MALE
	adminCKey = "Lacrimosamll"
/datum/loadout_item/plushies/lucky
	name = "Lucky Plush"
	item_path = /obj/item/toy/plush/admin/lucky
/datum/store_item/plushies/quote
	name = "Lucky Plush"
	item_path = /obj/item/toy/plush/admin/lucky
	item_cost = 7500
