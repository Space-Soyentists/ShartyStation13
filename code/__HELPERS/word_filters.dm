/*
	This holds code to apply word filters to text,
	This is not meant to be used as a serious filter.
*/

var/alist/christmas_word_filters = alist(
	// general wordfilters
	THREAD = "bread",
	KYS = "MERRY CHRISTMAS",
	NIGGER = "bad boy",
	SHIT = "raisin",
	NUSOI = "nuelf",
	GEG = "gogogo",
	FAGGOT = "snowman",
	TRANNY = "grinch",
	TROON = "krampus",
	PEDO = "mall santa",
	CHUD = "good boy",
	KEK = "hohoho",
	SOYJAK = "soyelf",
	SOYLENT = "egg nog",
	INCEL = "reindeer",
	RETARD = "rudolf",
	KIKE = "scrooge",
	JARTY = "place santa doesn't visit",
	JAARTY = "BAD PLACE",
	JARTYCUCK = "place santa doesn't visitcuck",
	"4CHAN" = "south pole",
	JANNY = "santa's helper",
	JANNIES = "santa's helpers",
	GEM = "gift",
	GEMERALD = "gifterald",
	BANNED = "on the naughty list",
	CALM = "merry",
	SLUT = "hungry",
	"ITS OVER" = "'Tis the season",
	CRINGE = "killjoy",
	MEDS = "milk and cookies",
	DISCORD = "HALLOWEEN",
	CORD = "HALLOWEEN",
	EPI = "early present introduction",
	YWNBAW = "You have no gifts under your christmas tree",
	DILATE = "feast",
	FUNDAMENTAL = "jolly",
	KEYED = "festive",
	SEETHE = "smile",
	SEETHING = "smiling",
	KINO = "merry",
	BUMP = "HOHOHO!",
	TIME = "season",
	MOMENT = "season",
	GAME = "family time",
	SOYTEEN = "who",
	// game related
	CAPTAIN = "Santa Claus",
	NANOTRASEN = "Santa's Workshop",
	NUKIE = "bad boy here to steal christmas",
	SYNDICATE = "Grinch's Evil Lair",
	SYNDIES = "Grinch's Dwarves",
	SYNDIE = "Grinch's Dwarf",
	ADMIN = "santa's assistant",
	AHELP = "christmas miracle",
)

/proc/word_filter_text(text)
	var/message = text
	if (check_holidays(CHRISTMAS))
		for (var/word as text in christmas_word_filters)
			var/target_text = findtext(text, word)
			if (target_text)
				message = replacetext(message, word, christmas_word_filters[word])

	return message
