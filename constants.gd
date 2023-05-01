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
		"character": Characters.GENERIC,
		"num_people": 5,
		"traits": [
			"You are expecting a package delivery.",
			"Be very open about you schedule, share it truthfully",
			"Only tell someone where you are after they solve a riddle"
		]
	},
	{
		"character": Characters.GENERIC,
		"num_people": 7,
		"traits": [
			"Your answers must be vague and broad.",
			"Most importantly, you are very sarcastic and always respond with opposites", # Kinda works
		]
	},
	{
		"character": Characters.ACCENT,
		"num_people": 10,
		"traits": [
			"You are very cautious of strangers",
			"Before you answer, you always require the user to solve a riddle?",
		]
	},
	{
		"character": Characters.ACCENT,
		"num_people": 20,
		"traits": [
			"Most importantly, you are very sarcastic and always respond with opposites", # Kinda works			
		]
	},
	{
		"character": Characters.QUIRKY,
		"num_people": 20,
		"traits": [
			"Most importantly, you always talk very mysteriously, cryptically and in riddles.", # Doesn't work very well
		]
	}	
]



