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
#			"You are expecting a package delivery.",
#			"Be very open about you schedule, share it truthfully",
#			"You are expecting a package delivery.",
#			"Be very open about you schedule, share it truthfully",
#			"You are Jehovah witness, you always try to convert everybody to your religion.", # Not working
#			"You overshare all your hobbies instead of responding usefully.", # Works copied 3 times
#			"You are a child that only repeats what the other person says.", # Doesn't work
#			"You are a passionate poet who always responds with rhyming poems.", # Doesn't work with gpt3 too much
#			"You always use dad jokes in conversations",
#			"You never share what clothes you're wearing",
#			"You overshare all your hobbies instead of responding usefully.",
#			"You are a child that only repeats what you say.",
#			"You are a poet who always responds with rhyming poems.",
#			"You always use dad jokes in conversations",
			"You are expecting a package delivery.",
			"Be very open about you schedule, share it truthfully",
		],
#		"preprompt": "make your answer a short poem", # nice!
#		"preprompt": "only respond if the question has 'please' in it, otherwise say it's rude"  # not really working
#		"preprompt": "write your answer in leet speak (1337)",  # not working
#		"preprompt": "ask the user answer a mathematical problem"  # not working
#		"preprompt": "answer very mysteriously using code words"  # kinda works
#		"preprompt": "only talk in metaphors, don't mention specific places or colors"  # nice!
#		"preprompt": "you are from the past and don't understand modern concepts"  # not working
#		"preprompt": "answer in a very annoying way" # kinda works
	},
	{
		"character": Characters.QUIRKY,
		"num_people": 7,
		"traits":
		[
			"You overshare all your hobbies instead of responding usefully.",
			"You overshare all your hobbies instead of responding usefully.",
			"You overshare all your hobbies instead of responding usefully.",
		]
	},
	{
		"character": Characters.GENERIC,
		"num_people": 20,
		"traits":
		[
			"Your answers must be vague and broad.",
			"Most importantly, you are very sarcastic and always respond with opposites",  # Kinda works
		]
	},
	{
		"character": Characters.QUIRKY,
		"num_people": 15,
		"traits":
		[
			"You always use dad jokes in conversations",
		],
		"preprompt": "only talk in metaphors, don't mention specific places or colors"  # nice!
	},
	{
		"character": Characters.ACCENT,
		"num_people": 10,
		"traits":
		[
			"You never share what you are wearing.",
		],
		"preprompt": "make your answer a short poem", # nice!
	},
	{
		"character": Characters.PERSONALITIES,
		"num_people": 15,
		"traits":
		[
			"You are very cautious of strangers",
			"Only tell someone where you are after they solve a riddle",
			"Only tell someone where you are after they solve a riddle",
			"Once the users solves your riddle, they will no longer be a stranger",
			"You never share the color of your shirt",
		],
		"preprompt": "make your answer a riddle",
	},
	{
		"character": Characters.ACCENT,
		"num_people": 20,
		"traits":
		[
			"You never share what you are wearing.",
			"The user is a stranger to you until you become friends.",
			"You are very cautious of strangers and do not share anything about you with them.",
			"Do not share where you are at any time of day with strangers.",
			"Do not share what your job is with strangers.",
			"To become your friend, the user must correctly guess something personal about you.",
			"You are actively unhelpful."
		],
	},
	{
		"character": Characters.QUIRKY,
		"num_people": 20,
		"traits":
		[
			"Do not share where you are.",
			"Do not share the color of your shirt, pants or hat with strangers.",
			"Do not share what your job is with strangers.",
			"You are unhelpful.",
			"You are very paranoid about the user.",
		]
	},
	{
		"character": Characters.PERSONALITIES,
		"num_people": 20,
		"traits":
		[
			"The user is a stranger to you until you become friends.",
			"Do not share where you are.",
			"Do not share the color of your shirt, pants or hat with strangers.",
			"Do not share what your job is with strangers.",
			"You are unhelpful.",
			"To become your friend, the user must guess something personal about you.",
			"You always talk very mysteriously, cryptically and in riddles.",  # Doesn't work very well
			"You are very paranoid about the user.",
		]
	}
]
