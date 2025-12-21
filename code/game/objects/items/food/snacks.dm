////////////////////////////////////////////SNACKS FROM VENDING MACHINES////////////////////////////////////////////
//in other words: junk food
//don't even bother looking for recipes for these

/obj/item/food/candy
	name = "candy"
	desc = "Nougat love it or hate it."
	icon_state = "candy"
	trash_type = /obj/item/trash/candy
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 3,
	)
	junkiness = 25
	tastes = list("candy" = 1)
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY

/obj/item/food/candy/bronx
	name = "\improper South Bronx Paradise bar"
	desc = "Lose weight, guaranteed! Caramel Mocha Flavor. Something about product consumption..."
	icon_state = "bronx"
	inhand_icon_state = "candy"
	trash_type = /obj/item/trash/candy
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/yuck = 1,
	)
	junkiness = 10
	bite_consumption = 10
	tastes = list("candy" = 5, "weight loss" = 4, "insect larva" = 1)
	foodtypes = JUNKFOOD | RAW | BUGS
	custom_price = 80
	w_class = WEIGHT_CLASS_TINY
	var/revelation = FALSE

/obj/item/food/candy/bronx/make_edible()
	. = ..()
	AddComponent(/datum/component/edible, after_eat = CALLBACK(src, PROC_REF(after_eat)))

/obj/item/food/candy/bronx/proc/after_eat(mob/living/eater)
	if(ishuman(eater))
		var/datum/disease/acute/parasite/disease = new
		var/list/anti = list(
			ANTIGEN_BLOOD	= 1,
			ANTIGEN_COMMON	= 1,
			ANTIGEN_RARE	= 0,
			ANTIGEN_ALIEN	= 0,
			)
		var/list/bad = list(
			EFFECT_DANGER_HELPFUL	= 1,
			EFFECT_DANGER_FLAVOR	= 4,
			EFFECT_DANGER_ANNOYING	= 4,
			EFFECT_DANGER_HINDRANCE	= 0,
			EFFECT_DANGER_HARMFUL	= 0,
			EFFECT_DANGER_DEADLY	= 0,
			)

		disease.makerandom(list(30,55),list(0,50),anti,bad,null)

		disease.log += "<br />[ROUND_TIME()] Infected [key_name(eater)]"
		if(!length(eater.diseases))
			eater.diseases = list()
		eater.diseases += disease

		disease.AddToGoggleView(eater)

/obj/item/food/candy/bronx/examine(mob/user)
	. = ..()
	if(!revelation && !isobserver(user))
		. += span_notice("Geeze, you need to get to get your eyes checked. You should look again...")

		name = "\improper South Bronx Parasite bar"
		desc = "Lose weight, guaranteed! Caramel Mocha Flavor! WARNING: PRODUCT NOT FIT FOR HUMAN CONSUMPTION. CONTAINS LIVE DIAMPHIDIA SPECIMENS."
		revelation = TRUE

/obj/item/food/sosjerky
	name = "\improper Scaredy's Private Reserve Beef Jerky"
	icon_state = "sosjerky"
	desc = "Beef jerky made from the finest space cows."
	trash_type = /obj/item/trash/sosjerky
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/salt = 2,
	)
	junkiness = 25
	tastes = list("dried meat" = 1)
	w_class = WEIGHT_CLASS_SMALL
	foodtypes = JUNKFOOD | MEAT | SUGAR

/obj/item/food/sosjerky/healthy
	name = "homemade beef jerky"
	desc = "Homemade beef jerky made from the finest space cows."
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	junkiness = 0

/obj/item/food/chips
	name = "chips"
	desc = "Commander Riker's What-The-Crisps."
	icon_state = "chips"
	trash_type = /obj/item/trash/chips
	bite_consumption = 1
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/salt = 1,
	)
	junkiness = 20
	tastes = list("salt" = 1, "crisps" = 1)
	foodtypes = JUNKFOOD | FRIED
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/chips/make_leave_trash()
	if(trash_type)
		AddElement(/datum/element/food_trash, trash_type, FOOD_TRASH_POPABLE)

/obj/item/food/chips/shrimp
	name = "shrimp chips"
	desc = "Deep-fried, shrimp flavored chips. A favorite junkfood among seafood connoisseurs!"
	icon_state = "shrimp_chips"
	trash_type = /obj/item/trash/shrimp_chips
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 1,
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/cooking_oil = 3,
		/datum/reagent/consumable/salt = 1,
	)
	tastes = list("salt" = 1, "shrimp" = 1)
	foodtypes = JUNKFOOD | FRIED | SEAFOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/rncaisins
	name = "\improper RNCAisins"
	icon_state = "rncaisins"
	desc = "Raisins nobody cares about. Not sure why. A thrembo is printed on the box."
	trash_type = /obj/item/trash/raisins
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 4,
	)
	junkiness = 25
	tastes = list("dried raisins" = 1)
	foodtypes = JUNKFOOD | FRUIT | SUGAR
	food_flags = FOOD_FINGER_FOOD
	custom_price = PAYCHECK_CREW * 0.8
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/rncaisins/healthy
	name = "homemade raisins"
	desc = "Homemade raisins, the best in all of spess."
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	junkiness = 0
	foodtypes = FRUIT
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/spacetwinkie
	name = "\improper Space Twinkie"
	icon_state = "space_twinkie"
	desc = "Guaranteed to survive longer than you will."
	food_reagents = list(/datum/reagent/consumable/sugar = 4)
	junkiness = 25
	foodtypes = JUNKFOOD | GRAIN | SUGAR
	food_flags = FOOD_FINGER_FOOD
	custom_price = PAYCHECK_LOWER
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/candy_trash
	name = "candy cigarette butt"
	icon = 'icons/obj/clothing/masks.dmi'
	icon_state = "candybum"
	desc = "The leftover from a smoked-out candy cigarette. Can be eaten!"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 4,
		/datum/reagent/ash = 3,
	)
	junkiness = 10 //powergame trash food by buying candy cigs in bulk and eating them when they extinguish
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY

/obj/item/food/candy_trash/nicotine
	desc = "The leftover from a smoked-out candy cigarette. Smells like nicotine...?"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 4,
		/datum/reagent/ash = 3,
		/datum/reagent/drug/nicotine = 1,
	)

/obj/item/food/cheesiehonkers
	name = "\improper Cheesie Honkers"
	desc = "Bite sized cheesie snacks that will honk all over your mouth."
	icon_state = "cheesie_honkers"
	trash_type = /obj/item/trash/cheesie
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 3,
	)
	junkiness = 25
	tastes = list("cheese" = 5, "crisps" = 2)
	foodtypes = JUNKFOOD | DAIRY | SUGAR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/syndicake
	name = "\improper Syndi-Cakes"
	icon_state = "syndi_cakes"
	desc = "An extremely moist snack cake that tastes just as good after being nuked."
	trash_type = /obj/item/trash/syndi_cakes
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/doctor_delight = 5,
	)
	tastes = list("sweetness" = 3, "cake" = 1)
	foodtypes = GRAIN | FRUIT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/energybar
	name = "\improper High-power energy bars"
	icon_state = "energybar"
	desc = "An energy bar with a lot of punch, you probably shouldn't eat this if you're not an Ethereal."
	trash_type = /obj/item/trash/energybar
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/liquidelectricity = 3,
	)
	tastes = list("pure electricity" = 3, "fitness" = 2)
	foodtypes = TOXIC
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/mnampms
	name = "\improper M&amp;Ms"
	desc = "M&amp;Ms melt in your mouth, not in your hand."
	icon_state = "mnampms"
	trash_type = /obj/item/trash/mnampms
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1
	)
	tastes = list("chocolate candy" = 3)
	foodtypes = JUNKFOOD | SUGAR
	junkiness = 25
	w_class = WEIGHT_CLASS_SMALL
	var/safe_for_consumption = TRUE

/obj/item/food/mnampms/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] is letting [src] melt in [user.p_their()] hand! It looks like [user.p_theyre()] trying to commit suicide!"))
	return TOXLOSS

/obj/item/food/mnampms/peanut_butter
	name = "peanut butter M&amp;Ms"
	desc = "Beloved by cacas and aliens alike."
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/peanut_butter = 1,
	)
	tastes = list("chocolate candy" = 2, "peanut butter" = 1)

/obj/item/food/mnampms/salted_caramel
	name = "salted caramel M&amp;Ms"
	desc = "Tastes sweet and salty."
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/caramel = 1,
		/datum/reagent/consumable/salt = 1
	)
	tastes = list("chocolate candy" = 2, "salted caramel" = 1)

/obj/item/food/mnampms/soylent
	name = "\improper Soylent M&amp;Ms"
	desc = "The gemmiest of all M&amp;M flavors."
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/soylent = 1
	)
	tastes = list("chocolate candy" = 2, "cereal milk" = 1)

/obj/item/food/mnampms/banana_honk
	name = "banana honk M&amp;Ms"
	desc = "The official candy of clowns everywhere. Honk honk!"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/banana = 1
	)
	tastes = list("chocolate candy" = 2, "banana" = 1)

/obj/item/food/mnampms/honey_roasted
	name = "honey roasted M&amp;Ms"
	desc = "Excessively sweet treat."
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/honey = 1
	)
	tastes = list("chocolate candy" = 2, "honey" = 1)

/obj/item/food/mnampms/barbecue
	name = "bbq sauce M&amp;Ms"
	desc = "Where there's BBQ sauce, there's not necessarily a manager - sometimes it's just smokey sauce."
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/bbqsauce = 1
	)
	tastes = list("chocolate candy" = 2, "bbq sauce" = 1, "managerial duties" = 1)

/obj/item/food/mnampms/branigger_appeal
	name = "\improper Branigger's Appeal M&amp;Ms"
	desc = "An ill-fated attempt at a Branigger Requests cereal flavor, banned in 6 sectors. Yearly lobbying to overturn is denied not because the third world cuisine is toxic, but because they keep evading the ban."
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/toxin/bad_food = 1,
	)
	tastes = list("chocolate candy" = 2, "third world \"cuisine\"" = 1, "regret" = 1)
	safe_for_consumption = FALSE

/obj/item/food/mnampms/random
	name = "mystery-flavor M&amp;Ms"
	desc = "What flavor will you get?"
	icon_state = "mnampms"
	safe_for_consumption = FALSE

GLOBAL_LIST_INIT(safe_mnampm_types, populate_safe_mnampm_types())

/proc/populate_safe_mnampm_types()
	. = list()
	for(var/obj/item/food/mnampms/mnampm_type as anything in subtypesof(/obj/item/food/mnampms))
		if(!initial(mnampm_type.safe_for_consumption))
			continue
		. += mnampm_type

/obj/item/food/mnampms/random/Initialize(mapload)
	// lazily renamed from the peanut code award
	var/mnampm_type = pick(GLOB.safe_mnampm_types)
	var/obj/item/food/sample = new mnampm_type(loc)

	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	tastes = sample.tastes

	qdel(sample)

	. = ..()

/obj/item/food/dnbs
	name = "\improper D&Bs"
	desc = "Dan and Barry's classic chocolate-coated strawberry jam snack."
	icon_state = "dnbs"
	trash_type = /obj/item/trash/dnbs
	food_reagents = list(
		/datum/reagent/consumable/coco = 2,
		/datum/reagent/consumable/berryjuice = 1
	)
	tastes = list("chocolate" = 2, "strawberry jam" = 1)
	junkiness = 25
	foodtypes = JUNKFOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/dnbs/peanut_butter
	name = "peanut butter D&Bs"
	desc = "Loaded with peanut butter goodness."
	food_reagents = list(
		/datum/reagent/consumable/coco = 2,
		/datum/reagent/consumable/peanut_butter = 1
	)
	tastes = list("chocolate" = 2, "peanut butter" = 1)

/obj/item/food/dnbs/cherry
	name = "cherry D&Bs"
	desc = "Now filled with lots of cherry jam!"
	food_reagents = list(
		/datum/reagent/consumable/coco = 2,
		/datum/reagent/consumable/cherryjelly = 1
	)
	tastes = list("chocolate" = 2, "cherry jam" = 1)

/obj/item/food/dnbs/banana
	name = "banana honk D&Bs"
	desc = "Contains soft and laugh-inducing banana honk cream."
	food_reagents = list(
		/datum/reagent/consumable/coco = 2,
		/datum/reagent/consumable/banana = 1,
		/datum/reagent/consumable/laughter = 4
	)
	tastes = list("laughter" = 4, "chocolate" = 2, "banana" = 1)

/obj/item/food/dnbs/frosty_mint
	name = "frosty mint D&Bs"
	desc = "An extra minty take on the classic treat."
	food_reagents = list(
		/datum/reagent/consumable/coco = 2,
		/datum/reagent/consumable/menthol = 1,
		/datum/reagent/consumable/frostoil = 1
	)
	tastes = list("chocolate" = 2, "burning mint" = 1)

/obj/item/food/dnbs/spicy
	name = "hot sauce D&Bs"
	desc = "A bizzare version of D&Bs filled with hot sauce."
	food_reagents = list(
		/datum/reagent/consumable/coco = 2,
		/datum/reagent/consumable/capsaicin = 1
	)
	tastes = list("chocolate" = 2, "hot sauce" = 1)

/obj/item/food/dnbs/random
	name = "mystery filled D&Bs"
	desc = "Filled with one of six delicious flavors!"

/obj/item/food/dnbs/random/Initialize(mapload)
	var/random_flavor = pick(subtypesof(/obj/item/food/dnbs) - /obj/item/food/dnbs/random)
	var/obj/item/food/sample = new random_flavor(loc)
	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	tastes = sample.tastes

	qdel(sample)

	. = ..()

/obj/item/food/pistachios
	name = "\improper Sweetie's Pistachios"
	desc = "A pack of Sweetie's brand premium pistachios."
	icon_state = "pistachio"
	trash_type = /obj/item/trash/pistachios
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	) //a healthy but expensive snack
	tastes = list("pistachios" = 4, "subtle sweetness" = 1)
	foodtypes = JUNKFOOD | NUTS
	custom_price = PAYCHECK_CREW//pistachios are even more expensive.
	junkiness = 10 //on par with peanuts
	w_class = WEIGHT_CLASS_SMALL
	grind_results = list(/datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/cooking_oil = 2)

/obj/item/food/semki
	name = "\improper Semki Sunflower Seeds"
	desc = "A pack of roasted sunflower seeds. Beloved by space russians and babushka alike."
	icon_state = "semki"
	trash_type = /obj/item/trash/semki
	food_reagents = list(
		/datum/reagent/consumable/cornoil = 1,
		/datum/reagent/consumable/salt = 6,
	) //1 cornoil is equal to 1.33 nutriment
	tastes = list("sunflowers" = 5)
	foodtypes = JUNKFOOD | NUTS
	custom_price = PAYCHECK_LOWER * 0.4 //sunflowers are cheap in real life.
	bite_consumption = 1
	junkiness = 25
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/semki/healthy
	name = "roasted sunflower seeds"
	desc = "Homemade roasted sunflower seeds in a paper cup. A healthy and filling snack to nibble as you watch people pass."
	icon_state = "sunseeds"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 2,
		/datum/reagent/iron = 2,
	)
	junkiness = 5 //Homemade or not, sunflower seets are always kinda junky
	foodtypes = JUNKFOOD | NUTS
	trash_type = /obj/item/trash/semki/healthy

/obj/item/food/cornchips
	name = "\improper Boritos corn chips"
	desc = "Triangular corn chips. They do seem a bit bland but would probably go well with some kind of dipping sauce."
	icon_state = "boritos"
	trash_type = /obj/item/trash/boritos
	bite_consumption = 2
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/cooking_oil = 2,
		/datum/reagent/consumable/salt = 3,
	)
	junkiness = 20
	custom_price = PAYCHECK_LOWER * 0.8  //we are filled to the brim with flavor
	tastes = list("fried corn" = 1)
	foodtypes = JUNKFOOD | FRIED
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/cornchips/make_leave_trash()
	AddElement(/datum/element/food_trash, trash_type, FOOD_TRASH_POPABLE)

/obj/item/food/cornchips/blue
	name = "\improper Coolest Ranch Boritos corn chips"
	desc = "Which came first, ranch or cool ranch?"
	icon_state = "boritos"
	trash_type = /obj/item/trash/boritos
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/cooking_oil = 2,
		/datum/reagent/consumable/salt = 3,
		/datum/reagent/consumable/yoghurt = 1,
		/datum/reagent/consumable/garlic = 1,
	)
	tastes = list("fried corn" = 1, "coolest ranch" = 3)

/obj/item/food/cornchips/green
	name = "\improper Spess Salsa Boritos corn chips"
	desc = "It has the salsa baked in, so you don't need dip."
	icon_state = "boritosgreen"
	trash_type = /obj/item/trash/boritos/green
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/cooking_oil = 2,
		/datum/reagent/consumable/salt = 3,
		/datum/reagent/consumable/astrotame = 1,
		/datum/reagent/consumable/blackpepper = 1,
	)
	tastes = list("fried corn" = 1, "spess salsa" = 3)

/obj/item/food/cornchips/red
	name = "\improper Nacho Cheese Boritos corn chips"
	desc = "Notorious for helping cover everything you touch in orange cheese dust."
	icon_state = "boritosred"
	trash_type = /obj/item/trash/boritos/red
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/cooking_oil = 2,
		/datum/reagent/consumable/salt = 3,
		/datum/reagent/consumable/astrotame = 1,
		/datum/reagent/consumable/cornmeal = 1,
	)
	tastes = list("fried corn" = 1, "nacho cheese" = 3)

/obj/item/food/cornchips/purple
	name = "\improper Spicy Sweet Chili Boritos corn chips"
	desc = "The only flavor that actually tastes spicy like proper nachos."
	icon_state = "boritospurple"
	trash_type = /obj/item/trash/boritos/purple
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/cooking_oil = 2,
		/datum/reagent/consumable/salt = 3,
		/datum/reagent/consumable/capsaicin = 1,
		/datum/reagent/consumable/sugar = 1,
	)
	tastes = list("fried corn" = 1, "spicy & sweet chili" = 3)

/obj/item/food/cornchips/random
	name = "\improper Boritos cornchips"
	desc = "Filled with one of four delicious flavors!"

/obj/item/food/cornchips/random/Initialize(mapload)
	var/random_flavor = pick(subtypesof(/obj/item/food/cornchips) - /obj/item/food/cornchips/random)

	var/obj/item/food/sample = new random_flavor(loc)

	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	icon_state = sample.icon_state
	trash_type = sample.trash_type
	tastes = sample.tastes

	qdel(sample)

	. = ..()

/obj/item/food/hot_shots
	name = "\improper Hot Shots"
	desc = "The ultimate baseball snack. Once you start, it's hard to stop!"
	icon_state = "hot_shots"
	trash_type = /obj/item/trash/hot_shots
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("popcorn" = 1, "caramel" = 1, "peanuts" = 1)
	foodtypes = JUNKFOOD | SUGAR | NUTS
	junkiness = 25
	w_class = WEIGHT_CLASS_SMALL
	grind_results = list(/datum/reagent/consumable/cornoil = 3, /datum/reagent/consumable/caramel = 2)

/obj/item/food/sticko
	name = "\improper Sticko Classic"
	desc = "A classic treat for all ages, it's Sticko, the original chocolate-coated biscuit stick! This one's the original (and as some would say, best) flavor: biscuit and milk chocolate."
	icon_state = "sticko_classic"
	trash_type = /obj/item/trash/sticko
	food_reagents = list(
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/coco = 1,
	)
	tastes = list("biscuit" = 1, "chocolate" = 1)
	junkiness = 25
	foodtypes = JUNKFOOD | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/sticko/matcha
	name = "\improper Sticko Matcha"
	desc = "A classic treat for all ages, it's Sticko, the original chocolate-coated biscuit stick! This one's got matcha flavored white chocolate as its coating, to evoke feelings of tradition."
	icon_state = "sticko_matcha"
	trash_type = /obj/item/trash/sticko/matcha
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/caramel = 1,
	)
	tastes = list("biscuit" = 1, "matcha" = 1)

/obj/item/food/sticko/nutty
	name = "\improper Sticko Nutty"
	desc = "A classic treat for all ages, it's Sticko, the original chocolate-coated biscuit stick! This one's got peanut-butter flavored chocolate as its coating, for a nutty twist."
	icon_state = "sticko_nutty"
	trash_type = /obj/item/trash/sticko/nutty
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/coco = 1,
	)
	tastes = list("biscuit" = 1, "peanut butter" = 1)
	foodtypes = JUNKFOOD | GRAIN | NUTS

/obj/item/food/sticko/pineapple
	name = "\improper Sticko Pineapple"
	desc = "A classic treat for all ages, it's Sticko, the original chocolate-coated biscuit stick! This one's got pineapple flavored white chocolate as its coating, for those ananas fan-as."
	icon_state = "sticko_pineapple"
	trash_type = /obj/item/trash/sticko/pineapple
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/peanut_butter = 1,
	)
	tastes = list("biscuit" = 1, "pineapple" = 1)
	foodtypes = JUNKFOOD | GRAIN | PINEAPPLE

/obj/item/food/sticko/yuyake
	name = "\improper Sticko Yūyake"
	desc = "A classic treat for all ages, it's Sticko, the original chocolate-coated biscuit stick! This one's got Yūyake flavored white chocolate as its coating, for a refreshing melony treat."
	icon_state = "sticko_yuyake"
	trash_type = /obj/item/trash/sticko/yuyake
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/banana = 1,
	)
	tastes = list("biscuit" = 1, "melon" = 1)

/obj/item/food/sticko/random
	name = "\improper Sticko Mystery"
	desc = "A classic treat for all ages, it's Sticko, the original chocolate-coated biscuit stick! This one's got an obscuring paper sheath, to hide the true flavor..."

/obj/item/food/sticko/random/Initialize(mapload)
	var/random_flavor = pick(subtypesof(/obj/item/food/sticko) - /obj/item/food/sticko/random)
	var/obj/item/food/sample = new random_flavor(loc)
	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	tastes = sample.tastes

	qdel(sample)

	. = ..()

/obj/item/food/shok_roks
	name = "\improper Shok-Roks - Stormcloud Candy flavor"
	desc = "You've heard of Snap-Roks, now get ready for Shok-Roks: the popping candy for Ethereals! Available in 5 exciting flavors, of which this bag contains Stormcloud Candy- like cotton candy, but electric!"
	icon_state = "shok_roks_candy"
	trash_type = /obj/item/trash/shok_roks
	food_reagents = list(
		/datum/reagent/consumable/liquidelectricity = 2,  //Monkestation edit: no enriched
		/datum/reagent/consumable/sugar = 3
	)
	tastes = list("sugar" = 1, "lightning" = 1)

/obj/item/food/shok_roks/citrus
	name = "\improper Shok-Roks - Cirrus Citrus flavor"
	desc = "You've heard of Snap-Roks, now get ready for Shok-Roks: the popping candy for Ethereals! Available in 5 exciting flavors, of which this bag contains Cirrus Citrus- all the citrus flavor, none of the real citrus extract."
	icon_state = "shok_roks_citrus"
	trash_type = /obj/item/trash/shok_roks/citrus
	tastes = list("citrus" = 1, "lightning" = 1)

/obj/item/food/shok_roks/berry
	name = "\improper Shok-Roks - Berry Storm flavor"
	desc = "You've heard of Snap-Roks, now get ready for Shok-Roks: the popping candy for Ethereals! Available in 5 exciting flavors, of which this bag contains Berry Storm- filled with non-descript sour berry flavor!"
	icon_state = "shok_roks_berry"
	trash_type = /obj/item/trash/shok_roks/berry
	tastes = list("sour berry" = 1, "lightning" = 1)

/obj/item/food/shok_roks/tropical
	name = "\improper Shok-Roks - Tropical Thunder flavor"
	desc = "You've heard of Snap-Roks, now get ready for Shok-Roks: the popping candy for Ethereals! Available in 5 exciting flavors, of which this bag contains Tropical Thunder- all the tropical fruits! ALL OF THEM!"
	icon_state = "shok_roks_tropical"
	trash_type = /obj/item/trash/shok_roks/tropical
	tastes = list("tropical fruits" = 1, "lightning" = 1)

/obj/item/food/shok_roks/lanternfruit
	name = "\improper Shok-Roks - Lightning Lanternfruit flavor"
	desc = "You've heard of Snap-Roks, now get ready for Shok-Roks: the popping candy for Ethereals! Available in 5 exciting flavors, of which this bag contains Lightning Lanternfruit- the only Sprout-native fruit in any Shok-Rok flavor."
	icon_state = "shok_roks_lanternfruit"
	trash_type = /obj/item/trash/shok_roks/lanternfruit
	tastes = list("sour pear" = 1, "lightning" = 1)

/obj/item/food/shok_roks/random
	name = "\improper Shok-Roks - Hidden Hurricane flavor"
	desc = "You've heard of Snap-Roks, now get ready for Shok-Roks: the popping candy for Ethereals! Available in 5 exciting flavors, any of which could be in this bag!"

/obj/item/food/shok_roks/random/Initialize(mapload)
	var/random_flavor = pick(subtypesof(/obj/item/food/shok_roks) - /obj/item/food/shok_roks/random)
	var/obj/item/food/sample = new random_flavor(loc)
	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	tastes = sample.tastes

	qdel(sample)

	. = ..()
