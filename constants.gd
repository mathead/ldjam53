extends Node

const FOOD_DRINK_SPOTS = ["pizza", "texmex", "pho", "sushi", "burger", "bbq", "ramen", "coffee"]
const FOOD_SPOTS = ["pizza", "texmex", "pho"]
const WORK_SPOTS = ["bank", "law office", "travel agency"]
const HOME_SPOTS = ["green apartment", "red apartment", "blue apartment"]
const MISC_SPOTS = ["gym", "market"]
const COLORS = {
	"green": Color.GREEN_YELLOW,
	"red": Color.DARK_RED,
	"blue": Color.CADET_BLUE,
	"black": Color.BLACK,
	"white": Color.WHITE,
	"yellow": Color.YELLOW,
	"pink": Color.HOT_PINK,
	"grey": Color.GRAY,
	"gray": Color.GRAY,
	"purple": Color.PURPLE,
	"brown": Color.SADDLE_BROWN,
	"khaki": Color.DARK_KHAKI,
	"orange": Color.ORANGE_RED,
	"none": Color.TRANSPARENT
}

var LEVELS = [
	{
		"character": Characters.GENERIC[0],
		"num_people": 5,
		"traits": [
			"You are expecting a package delivery.",
			"Be very open about you schedule, share it truthfully",
#			"Don't reveal what you're wearing.",
#			"Most importantly, you always talk very mysteriously, cryptically and in riddles.", # Doesn't work very well
			"Most importantly, you are very sarcastic and always respond with opposites", # Kinda works
			"You are very cautious of strangers"
		]
	},
	{
		"character": Characters.GENERIC[1],
		"num_people": 7,
		"traits": [
			"Your answers must be vague and broad."
		]
	},
	{
		"character": Characters.ACCENT[0],
		"num_people": 10,
		"traits": [
			""
		]
	},
	{
		"character": Characters.ACCENT[1],
		"num_people": 20,
		"traits": [
			""
		]
	},
	{
		"character": Characters.QUIRKY[0],
		"num_people": 20,
		"traits": [
			""
		]
	}	
]



