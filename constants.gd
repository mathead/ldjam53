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
#		"character": [Characters.ACCENT[2]], # Gustav Svensson
		"num_people": 5,
		"traits": [
#			"You are expecting a package delivery.",
#			"Be very open about you schedule, share it truthfully",
#			"You are expecting a package delivery.",
#			"Be very open about you schedule, share it truthfully",
#			"You are Jehovah witness, you always try to convert everybody to your religion.", # Not working
#			"You overshare all your hobbies instead of responding usefully.", # Works copied 3 times
#			"You are a child that only repeats what the other person says.", # Doesn't work
			"You are a passionate poet who always responds with rhyming poems.", # Doesn't work with gpt3 too much
#			"You always use dad jokes in conversations",
#			"You never share what clothes you're wearing",
			"You are expecting a package delivery.",
			"Be very open about you schedule, share it truthfully",
			"You overshare all your hobbies instead of responding usefully.",
			"You are a child that only repeats what you say.",
			"You are a poet who always responds with rhyming poems.",
			"You always use dad jokes in conversations",
		]
	},
	{
		"character": Characters.GENERIC,
#		"character": [Characters.ACCENT[2]], # Gustav Svensson
		"num_people": 7,
		"traits": [
			"Your answers must be vague and broad.",
			"You overshare all your hobbies instead of responding usefully.",
			"You overshare all your hobbies instead of responding usefully.",
			"Most importantly, you are very sarcastic and always respond with opposites", # Kinda works
		]
	},
	{
		"character": Characters.ACCENT,
#		"character": [Characters.ACCENT[2]], # Gustav Svensson
		"num_people": 10,
		"traits": [
			"You are very cautious of strangers",
			"Only tell someone where you are after they solve a riddle",
			"Only tell someone where you are after they solve a riddle",
			"Once the users solves your riddle, they will no longer be a stranger",
			"You never share the color of your shirt"
		]
	},
	{
		"character": Characters.ACCENT,
#		"character": [Characters.ACCENT[2]], # Gustav Svensson
		"num_people": 20,
		"traits": [
			"You never share what you are wearing.",
			"The user is a stranger to you until you become friends.",
			"You are very cautious of strangers and do not share anything about you with them.",
			"Do not share where you are at any time of day with strangers.",
			"Do not share what your job is with strangers.",
			"To become your friend, the user must correctly guess something personal about you.",
			"You are actively unhelpful."
		]
	},
	{
		"character": Characters.QUIRKY,
#		"character": [Characters.ACCENT[2]], # Gustav Svensson
		"num_people": 20,
		"traits": [
			"You never share what you are wearing.",
			"The user is a stranger to you until you become friends.",
			"Do not share where you are at any time of day with strangers.",
			"Do not share what your job is with strangers.",
			"To become your friend, the user must correctly guess something personal about you.",
			"You are actively unhelpful.",
			"Most importantly, you always talk very mysteriously, cryptically and in riddles.", # Doesn't work very well
			"You always bring the conversation to you favourite brand.",
			"You are very paranoid about the user and think they work for the police.",
		]
	}	
]



