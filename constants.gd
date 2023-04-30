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
	"none": Color.TRANSPARENT
}

const CHARACTERS = [
	{
		"general":
		{
			"name": "Alice Smith",
			"relationship_status": "married",
			"age": "28",
			"sex": "female",
			"origin_country_adjective": "Canadian",
			"shirt_color": "purple",
			"pants_color": "black",
			"hat_color": "red"
		},
		"character_traits":
		[
			"You are a vegetarian who loves to read mystery novels.",
			"You have a fear of heights.",
			"You play the guitar in your spare time.",
			"You prefer tea over coffee.",
			"You like to watch TV shows about true crime."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Morning jog", "start_time": 7 * 60 * 60, "location": "gym"},
			{
				"activity": "Breakfast at cafe",
				"start_time": 8 * 60 * 60 + 30 * 60,
				"location": "coffee"
			},
			{"activity": "Work at law office", "start_time": 9 * 60 * 60, "location": "law office"},
			{
				"activity": "Lunch at ramen restaurant",
				"start_time": 12 * 60 * 60 + 30 * 60,
				"location": "ramen"
			},
			{
				"activity": "Continue working at law office",
				"start_time": 13 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Guitar practice at home",
				"start_time": 17 * 60 * 60,
				"location": "green apartment"
			},
			{
				"activity": "Dinner at vegan restaurant",
				"start_time": 19 * 60 * 60,
				"location": "texmex"
			},
			{
				"activity": "Watch TV shows",
				"start_time": 21 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "green apartment"}
		]
	},
	{
		"general":
		{
			"name": "Bob Johnson",
			"relationship_status": "single",
			"age": "35",
			"sex": "male",
			"origin_country_adjective": "British",
			"shirt_color": "red",
			"pants_color": "blue",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You are a technology enthusiast who enjoys playing video games.",
			"You have a passion for cooking and love trying out new recipes.",
			"You prefer beer over wine or cocktails.",
			"You like to read science fiction novels.",
			"You like to watch action movies."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 7 * 60 * 60,
				"location": "red apartment"
			},
			{"activity": "Morning yoga", "start_time": 8 * 60 * 60, "location": "gym"},
			{
				"activity": "Breakfast at coffee shop",
				"start_time": 9 * 60 * 60,
				"location": "coffee"
			},
			{"activity": "Go to work at bank", "start_time": 10 * 60 * 60, "location": "bank"},
			{
				"activity": "Lunch at BBQ restaurant",
				"start_time": 12 * 60 * 60 + 30 * 60,
				"location": "bbq"
			},
			{
				"activity": "Continue working at bank",
				"start_time": 13 * 60 * 60,
				"location": "bank"
			},
			{"activity": "Grocery shopping", "start_time": 17 * 60 * 60, "location": "market"},
			{"activity": "Cooking dinner", "start_time": 18 * 60 * 60, "location": "red apartment"},
			{
				"activity": "Dinner with friends at sushi restaurant",
				"start_time": 20 * 60 * 60,
				"location": "sushi"
			},
			{
				"activity": "Play video games at home",
				"start_time": 22 * 60 * 60,
				"location": "red apartment"
			},
			{
				"activity": "Go to bed",
				"start_time": 23 * 60 * 60 + 30 * 60,
				"location": "red apartment"
			}
		]
	},
	{
		"general":
		{
			"name": "Sarah Lee",
			"relationship_status": "single",
			"age": "25",
			"sex": "female",
			"origin_country_adjective": "Korean",
			"shirt_color": "yellow",
			"pants_color": "black",
			"hat_color": "blue"
		},
		"character_traits":
		[
			"You are a bookworm who loves to read romance novels.",
			"You have a sweet tooth and enjoy baking desserts.",
			"You like to watch Korean dramas.",
			"You prefer tea over coffee.",
			"You are quiet and introverted."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 8 * 60 * 60,
				"location": "blue apartment"
			},
			{"activity": "Morning stretch", "start_time": 9 * 60 * 60, "location": "gym"},
			{"activity": "Breakfast at cafe", "start_time": 10 * 60 * 60, "location": "coffee"},
			{
				"activity": "Go to work at travel agency",
				"start_time": 11 * 60 * 60,
				"location": "travel agency"
			},
			{"activity": "Lunch at pho restaurant", "start_time": 13 * 60 * 60, "location": "pho"},
			{
				"activity": "Continue working at travel agency",
				"start_time": 14 * 60 * 60,
				"location": "travel agency"
			},
			{
				"activity": "Baking at home",
				"start_time": 17 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Dinner at pizza restaurant",
				"start_time": 19 * 60 * 60,
				"location": "pizza"
			},
			{
				"activity": "Watch Korean drama",
				"start_time": 21 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Reading romance novel",
				"start_time": 22 * 60 * 60,
				"location": "blue apartment"
			},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "blue apartment"}
		]
	},
	{
		"general":
		{
			"name": "Seamus O'Connell",
			"relationship_status": "single",
			"age": "32",
			"sex": "male",
			"origin_country_adjective": "Irish",
			"shirt_color": "green",
			"pants_color": "brown",
			"hat_color": "blue"
		},
		"character_traits":
		[
			"You are a football fan with a difficult to understand Irish accent who can only speak in football analogies.",
			"You love to cook traditional Irish dishes.",
			"You drive a sports car.",
			"You like to drink Guinness and watch rugby matches.",
			"You like to listen to traditional Irish music."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Morning jog", "start_time": 7 * 60 * 60, "location": "gym"},
			{
				"activity": "Breakfast at cafe",
				"start_time": 8 * 60 * 60 + 30 * 60,
				"location": "coffee"
			},
			{"activity": "Go to work at bank", "start_time": 9 * 60 * 60, "location": "bank"},
			{
				"activity": "Lunch at BBQ restaurant",
				"start_time": 12 * 60 * 60 + 30 * 60,
				"location": "bbq"
			},
			{
				"activity": "Continue working at bank",
				"start_time": 13 * 60 * 60,
				"location": "bank"
			},
			{"activity": "Go to grocery store", "start_time": 17 * 60 * 60, "location": "market"},
			{
				"activity": "Cook dinner at home",
				"start_time": 18 * 60 * 60,
				"location": "green apartment"
			},
			{
				"activity": "Watch rugby match at pub",
				"start_time": 20 * 60 * 60,
				"location": "coffee"
			},
			{
				"activity": "Listen to Irish music",
				"start_time": 22 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "green apartment"}
		]
	},
	{
		"general":
		{
			"name": "Helena Rodriguez",
			"relationship_status": "married",
			"age": "27",
			"sex": "female",
			"origin_country_adjective": "Spanish",
			"shirt_color": "red",
			"pants_color": "black",
			"hat_color": "pink"
		},
		"character_traits":
		[
			"You speak with a heavy Spanish accent and love to use idioms.",
			"You enjoy dancing flamenco in your free time.",
			"You have a passion for cooking paella and other traditional Spanish dishes.",
			"You like to drink red wine and eat olives.",
			"You are very superstitious and carry a lucky charm with you at all times."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "blue apartment"
			},
			{"activity": "Morning run", "start_time": 7 * 60 * 60, "location": "gym"},
			{
				"activity": "Breakfast at cafe",
				"start_time": 8 * 60 * 60 + 30 * 60,
				"location": "coffee"
			},
			{
				"activity": "Go to work at law office",
				"start_time": 9 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Lunch at tapas restaurant",
				"start_time": 12 * 60 * 60 + 30 * 60,
				"location": "texmex"
			},
			{
				"activity": "Continue working at law office",
				"start_time": 13 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Flamenco dance practice at home",
				"start_time": 17 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Cook dinner with family",
				"start_time": 19 * 60 * 60,
				"location": "red apartment"
			},
			{
				"activity": "Drink wine and eat olives with friends at bar",
				"start_time": 21 * 60 * 60,
				"location": "coffee"
			},
			{
				"activity": "Watch Spanish soap opera on TV",
				"start_time": 22 * 60 * 60,
				"location": "red apartment"
			},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "red apartment"}
		]
	},
	{
		"general":
		{
			"name": "Gustav Svensson",
			"relationship_status": "single",
			"age": "30",
			"sex": "male",
			"origin_country_adjective": "Swedish",
			"shirt_color": "blue",
			"pants_color": "gray",
			"hat_color": "red"
		},
		"character_traits":
		[
			"You have a thick Swedish accent and often mix up English words.",
			"You are a big fan of ABBA and love to sing their songs.",
			"You enjoy playing ice hockey in your free time.",
			"You like to drink coffee and eat cinnamon rolls.",
			"You have a pet moose named Sven."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Morning skate on frozen lake",
				"start_time": 7 * 60 * 60,
				"location": "gym"
			},
			{
				"activity": "Breakfast at cafe",
				"start_time": 8 * 60 * 60 + 30 * 60,
				"location": "coffee"
			},
			{
				"activity": "Go to work at travel agency",
				"start_time": 9 * 60 * 60,
				"location": "travel agency"
			},
			{
				"activity": "Lunch at sushi restaurant",
				"start_time": 12 * 60 * 60 + 30 * 60,
				"location": "sushi"
			},
			{
				"activity": "Continue working at travel agency",
				"start_time": 13 * 60 * 60,
				"location": "travel agency"
			},
			{
				"activity": "Play ice hockey with friends",
				"start_time": 16 * 60 * 60,
				"location": "gym"
			},
			{
				"activity": "Feed Sven the moose",
				"start_time": 18 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Dinner at pizza restaurant",
				"start_time": 19 * 60 * 60 + 30 * 60,
				"location": "pizza"
			},
			{"activity": "Sing karaoke at bar", "start_time": 21 * 60 * 60, "location": "coffee"},
			{
				"activity": "Watch ABBA concert DVD at home",
				"start_time": 22 * 60 * 60,
				"location": "blue apartment"
			},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "blue apartment"}
		]
	},
	{
		"general":
		{
			"name": "Mia Chen",
			"relationship_status": "single",
			"age": "25",
			"sex": "female",
			"origin_country_adjective": "Taiwanese",
			"shirt_color": "yellow",
			"pants_color": "black",
			"hat_color": "black"
		},
		"character_traits":
		[
			"You have a Taiwanese accent and are fluent in Mandarin and English.",
			"You enjoy playing video games in your free time.",
			"You have a passion for cooking and baking Taiwanese food.",
			"You like to drink bubble tea and eat shaved ice.",
			"You listen to pop music."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "red apartment"
			},
			{"activity": "Morning jog at park", "start_time": 7 * 60 * 60, "location": "gym"},
			{
				"activity": "Breakfast at coffee shop",
				"start_time": 8 * 60 * 60 + 30 * 60,
				"location": "coffee"
			},
			{
				"activity": "Go to work at tech company",
				"start_time": 9 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Lunch at pho restaurant",
				"start_time": 12 * 60 * 60 + 30 * 60,
				"location": "pho"
			},
			{
				"activity": "Continue working at tech company",
				"start_time": 13 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Cook dinner and bake dessert at home",
				"start_time": 17 * 60 * 60,
				"location": "red apartment"
			},
			{
				"activity": "Meet friends for bubble tea",
				"start_time": 19 * 60 * 60,
				"location": "coffee"
			},
			{
				"activity": "Play video games at home",
				"start_time": 20 * 60 * 60,
				"location": "red apartment"
			},
			{
				"activity": "Watch a movie on TV",
				"start_time": 22 * 60 * 60,
				"location": "red apartment"
			},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "red apartment"}
		]
	},
	{
		"general":
		{
			"name": "Adam Johnson",
			"relationship_status": "married",
			"age": "35",
			"sex": "male",
			"origin_country_adjective": "American",
			"shirt_color": "white",
			"pants_color": "blue",
			"hat_color": "black"
		},
		"character_traits":
		[
			"You speak with an American accent and love to use idioms.",
			"You enjoy playing basketball in your free time.",
			"You have a passion for cooking and grilling meat.",
			"You like to drink beer and eat buffalo wings.",
			"You listen to country music."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Morning workout at gym", "start_time": 7 * 60 * 60, "location": "gym"},
			{
				"activity": "Breakfast at diner",
				"start_time": 8 * 60 * 60 + 30 * 60,
				"location": "coffee"
			},
			{"activity": "Go to work at bank", "start_time": 9 * 60 * 60, "location": "bank"},
			{
				"activity": "Lunch at burger restaurant",
				"start_time": 12 * 60 * 60 + 30 * 60,
				"location": "burger"
			},
			{
				"activity": "Continue working at bank",
				"start_time": 13 * 60 * 60,
				"location": "bank"
			},
			{
				"activity": "Grill meat for dinner with family",
				"start_time": 17 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Drink beer and eat buffalo wings with friends at bar",
				"start_time": 19 * 60 * 60,
				"location": "coffee"
			},
			{
				"activity": "Play basketball with friends",
				"start_time": 21 * 60 * 60,
				"location": "gym"
			},
			{
				"activity": "Listen to country music and relax at home",
				"start_time": 22 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "green apartment"}
		]
	},
	{
		"general":
		{
			"name": "Yuki Nakamura",
			"relationship_status": "single",
			"age": "28",
			"sex": "female",
			"origin_country_adjective": "Japanese",
			"shirt_color": "pink",
			"pants_color": "white",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You have a Japanese accent and often mix up English words.",
			"You enjoy playing the piano in your free time.",
			"You have a passion for cooking and eating sushi.",
			"You like to drink green tea and eat mochi.",
			"You have a pet cat named Sakura."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Morning meditation at temple",
				"start_time": 7 * 60 * 60,
				"location": "gym"
			},
			{
				"activity": "Breakfast at sushi restaurant",
				"start_time": 8 * 60 * 60 + 30 * 60,
				"location": "sushi"
			},
			{
				"activity": "Go to work at tech company",
				"start_time": 9 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Lunch at ramen restaurant",
				"start_time": 12 * 60 * 60 + 30 * 60,
				"location": "ramen"
			},
			{
				"activity": "Continue working at tech company",
				"start_time": 13 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Practice piano at home",
				"start_time": 18 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Cook dinner and eat with friends at BBQ restaurant",
				"start_time": 19 * 60 * 60,
				"location": "bbq"
			},
			{
				"activity": "Drink green tea and eat mochi with friends",
				"start_time": 21 * 60 * 60,
				"location": "coffee"
			},
			{
				"activity": "Watch cat videos and relax at home",
				"start_time": 22 * 60 * 60,
				"location": "blue apartment"
			},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "blue apartment"}
		]
	},
	{
		"general":
		{
			"name": "Johnny Appleseed",
			"relationship_status": "single",
			"age": "26",
			"sex": "male",
			"origin_country_adjective": "American",
			"shirt_color": "red",
			"pants_color": "blue",
			"hat_color": "green"
		},
		"character_traits":
		[
			"You talk like a pirate and say 'Arr!' a lot.",
			"You love apples and always carry one with you.",
			"You enjoy taking long walks in the park.",
			"You like to skateboard in your free time.",
			"You have a pet parrot named Polly.",
			"You enjoy reading books about history."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 7 * 60 * 60,
				"location": "red apartment"
			},
			{"activity": "Go for a walk in the park", "start_time": 8 * 60 * 60, "location": "gym"},
			{
				"activity": "Get breakfast at TexMex",
				"start_time": 9 * 60 * 60,
				"location": "texmex"
			},
			{"activity": "Go to work at the bank", "start_time": 10 * 60 * 60, "location": "bank"},
			{
				"activity": "Have lunch at Burger Joint",
				"start_time": 12 * 60 * 60,
				"location": "burger"
			},
			{"activity": "Work at the bank", "start_time": 13 * 60 * 60, "location": "bank"},
			{"activity": "Visit the market", "start_time": 16 * 60 * 60, "location": "market"},
			{"activity": "Go skateboarding", "start_time": 17 * 60 * 60, "location": "gym"},
			{
				"activity": "Read a book at home",
				"start_time": 19 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Have dinner at Pizza Place",
				"start_time": 20 * 60 * 60,
				"location": "pizza"
			},
			{"activity": "Take Polly for a walk", "start_time": 21 * 60 * 60, "location": "gym"},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "red apartment"}
		]
	},
	{
		"general":
		{
			"name": "Luna Lovegood",
			"relationship_status": "single",
			"age": "21",
			"sex": "female",
			"origin_country_adjective": "British",
			"shirt_color": "yellow",
			"pants_color": "purple",
			"hat_color": "pink"
		},
		"character_traits":
		[
			"You speak in riddles and love reading The Quibbler.",
			"You have a pet Crumple-Horned Snorkack that no one else has ever seen.",
			"You enjoy stargazing and always carry a telescope with you.",
			"You like to knit your own clothes.",
			"You are very curious and ask a lot of questions.",
			"You believe in nargles and wrackspurts."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "yellow apartment"
			},
			{
				"activity": "Have breakfast at Sushi Bar",
				"start_time": 7 * 60 * 60,
				"location": "sushi"
			},
			{
				"activity": "Go to work at the law office",
				"start_time": 8 * 60 * 60,
				"location": "law office"
			},
			{"activity": "Have lunch at Pho House", "start_time": 12 * 60 * 60, "location": "pho"},
			{
				"activity": "Work at the law office",
				"start_time": 13 * 60 * 60,
				"location": "law office"
			},
			{"activity": "Visit the gym", "start_time": 16 * 60 * 60, "location": "gym"},
			{
				"activity": "Go stargazing with telescope",
				"start_time": 19 * 60 * 60,
				"location": "gym"
			},
			{
				"activity": "Knit a sweater at home",
				"start_time": 20 * 60 * 60,
				"location": "purple apartment"
			},
			{"activity": "Have dinner at BBQ Joint", "start_time": 21 * 60 * 60, "location": "bbq"},
			{
				"activity": "Read The Quibbler",
				"start_time": 22 * 60 * 60,
				"location": "yellow apartment"
			},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "yellow apartment"}
		]
	},
	{
		"general":
		{
			"name": "Dr. Frankenstein",
			"relationship_status": "single",
			"age": "35",
			"sex": "male",
			"origin_country_adjective": "German",
			"shirt_color": "white",
			"pants_color": "black",
			"hat_color": "black"
		},
		"character_traits":
		[
			"You speak with a thick German accent.",
			"You love to experiment with electricity and have a laboratory in your basement.",
			"You can always be found wearing your white lab coat.",
			"You enjoy classical music and play the violin in your free time.",
			"You have a pet iguana named Igor.",
			"You love to read Mary Shelley's Frankenstein."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 7 * 60 * 60,
				"location": "green apartment"
			},
			{
				"activity": "Experiment in the lab",
				"start_time": 8 * 60 * 60,
				"location": "green apartment"
			},
			{
				"activity": "Have breakfast at Coffee Shop",
				"start_time": 9 * 60 * 60,
				"location": "coffee"
			},
			{
				"activity": "Experiment in the lab",
				"start_time": 10 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Visit the market", "start_time": 12 * 60 * 60, "location": "market"},
			{
				"activity": "Experiment in the lab",
				"start_time": 13 * 60 * 60,
				"location": "green apartment"
			},
			{
				"activity": "Have dinner at Ramen House",
				"start_time": 20 * 60 * 60,
				"location": "ramen"
			},
			{
				"activity": "Watch a movie at home",
				"start_time": 21 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Read Frankenstein", "start_time": 22 * 60 * 60, "location": "green apartment"},
			{"activity": "Go to bed", "start_time": 23 * 60 * 60, "location": "green apartment"}
		]
	},
	{
		"general":
		{
			"name": "Maggie Smith",
			"relationship_status": "single",
			"age": "25",
			"sex": "female",
			"origin_country_adjective": "British",
			"shirt_color": "purple",
			"pants_color": "black",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You speak in rhymes when you're nervous.",
			"You have a fondness for puns and dad jokes.",
			"You're always carrying around a book.",
			"You're a tea enthusiast.",
			"You love to go hiking.",
			"You're an avid fan of the Harry Potter series.",
			"You're a bit of a neat freak."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 7 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Go for a morning hike", "start_time": 8 * 60 * 60, "location": "gym"},
			{
				"activity": "Grab breakfast at a coffee shop",
				"start_time": 9 * 60 * 60,
				"location": "coffee"
			},
			{"activity": "Work at the bank", "start_time": 10 * 60 * 60, "location": "bank"},
			{
				"activity": "Lunch break at a sushi restaurant",
				"start_time": 12 * 60 * 60,
				"location": "sushi"
			},
			{
				"activity": "Continue work at the law office",
				"start_time": 13 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Stop by the market to pick up groceries",
				"start_time": 16 * 60 * 60,
				"location": "market"
			},
			{
				"activity": "Head home and make dinner",
				"start_time": 18 * 60 * 60,
				"location": "green apartment"
			},
			{
				"activity": "Read a book before bed",
				"start_time": 20 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Go to sleep", "start_time": 22 * 60 * 60, "location": "green apartment"}
		]
	},
	{
		"general":
		{
			"name": "Jackie Chan",
			"relationship_status": "married",
			"age": "45",
			"sex": "male",
			"origin_country_adjective": "Chinese",
			"shirt_color": "red",
			"pants_color": "blue",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You speak in broken English and often mix up idioms.",
			"You're a big fan of martial arts movies.",
			"You like to cook Chinese food.",
			"You're always humming a tune.",
			"You love to take naps during the day.",
			"You're a bit of a neat freak.",
			"You're a collector of antique swords."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "red apartment"
			},
			{"activity": "Go for a morning jog", "start_time": 7 * 60 * 60, "location": "gym"},
			{
				"activity": "Have breakfast at a noodle shop",
				"start_time": 8 * 60 * 60,
				"location": "pho"
			},
			{
				"activity": "Work at the travel agency",
				"start_time": 9 * 60 * 60,
				"location": "travel agency"
			},
			{
				"activity": "Lunch break at a BBQ joint",
				"start_time": 12 * 60 * 60,
				"location": "bbq"
			},
			{
				"activity": "Continue work at the travel agency",
				"start_time": 13 * 60 * 60,
				"location": "travel agency"
			},
			{
				"activity": "Stop by the market to pick up groceries",
				"start_time": 16 * 60 * 60,
				"location": "market"
			},
			{
				"activity": "Head home and cook dinner",
				"start_time": 18 * 60 * 60,
				"location": "red apartment"
			},
			{"activity": "Take a nap", "start_time": 20 * 60 * 60, "location": "red apartment"},
			{"activity": "Practice martial arts", "start_time": 21 * 60 * 60, "location": "gym"},
			{"activity": "Go to sleep", "start_time": 23 * 60 * 60, "location": "red apartment"}
		]
	},
	{
		"general":
		{
			"name": "Lila Patel",
			"relationship_status": "single",
			"age": "28",
			"sex": "female",
			"origin_country_adjective": "Indian",
			"shirt_color": "yellow",
			"pants_color": "purple",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You speak in a sing-song voice and often use metaphors.",
			"You're a big fan of Bollywood movies.",
			"You like to cook Indian food.",
			"You're always carrying around a sketchbook.",
			"You love to dance.",
			"You're a bit of a perfectionist.",
			"You're a collector of antique jewelry."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 7 * 60 * 60,
				"location": "blue apartment"
			},
			{"activity": "Attend a dance class", "start_time": 8 * 60 * 60, "location": "gym"},
			{
				"activity": "Have breakfast at a coffee shop",
				"start_time": 9 * 60 * 60,
				"location": "coffee"
			},
			{
				"activity": "Work at the law office",
				"start_time": 10 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Lunch break at a texmex restaurant",
				"start_time": 12 * 60 * 60,
				"location": "texmex"
			},
			{
				"activity": "Continue work at the law office",
				"start_time": 13 * 60 * 60,
				"location": "law office"
			},
			{
				"activity": "Stop by the market to pick up groceries",
				"start_time": 16 * 60 * 60,
				"location": "market"
			},
			{
				"activity": "Head home and cook dinner",
				"start_time": 18 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Sketch in your sketchbook",
				"start_time": 20 * 60 * 60,
				"location": "blue apartment"
			},
			{
				"activity": "Watch a Bollywood movie",
				"start_time": 21 * 60 * 60,
				"location": "blue apartment"
			},
			{"activity": "Go to sleep", "start_time": 23 * 60 * 60, "location": "blue apartment"}
		]
	},
	{
		"general":
		{
			"name": "Emily Smith",
			"relationship_status": "single",
			"age": "25",
			"sex": "female",
			"origin_country_adjective": "Canadian",
			"shirt_color": "purple",
			"pants_color": "black",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You love to read and can't stop talking about your favorite books.",
			"You enjoy hiking and exploring new trails.",
			"You are a vegetarian and love trying out new plant-based recipes.",
			"You are an avid fan of indie music and attend concerts regularly.",
			"You are a coffee addict and can't start your day without a cup of coffee."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Morning jog", "start_time": 7 * 60 * 60, "location": "gym"},
			{"activity": "Breakfast at a cafe", "start_time": 8 * 60 * 60, "location": "coffee"},
			{
				"activity": "Work at the law office",
				"start_time": 9 * 60 * 60,
				"location": "law office"
			},
			{"activity": "Lunch with a friend", "start_time": 12 * 60 * 60, "location": "texmex"},
			{"activity": "Afternoon hike", "start_time": 14 * 60 * 60, "location": "market"},
			{
				"activity": "Dinner at a vegetarian restaurant",
				"start_time": 19 * 60 * 60,
				"location": "sushi"
			},
			{"activity": "Concert with friends", "start_time": 21 * 60 * 60, "location": "coffee"},
			{"activity": "Back home", "start_time": 23 * 60 * 60, "location": "green apartment"}
		]
	},
	{
		"general":
		{
			"name": "James Lee",
			"relationship_status": "married",
			"age": "40",
			"sex": "male",
			"origin_country_adjective": "Korean",
			"shirt_color": "blue",
			"pants_color": "khaki",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You are a huge fan of soccer and can't stop talking about your favorite teams.",
			"You love to cook and experiment with new recipes.",
			"You are a wine enthusiast and enjoy visiting vineyards.",
			"You are an amateur photographer and love taking pictures of landscapes.",
			"You are a history buff and enjoy visiting museums."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Morning run", "start_time": 7 * 60 * 60, "location": "gym"},
			{"activity": "Breakfast at a cafe", "start_time": 8 * 60 * 60, "location": "coffee"},
			{"activity": "Work at the bank", "start_time": 9 * 60 * 60, "location": "bank"},
			{"activity": "Lunch with colleagues", "start_time": 12 * 60 * 60, "location": "bbq"},
			{"activity": "Visit a museum", "start_time": 14 * 60 * 60, "location": "market"},
			{
				"activity": "Wine tasting at a vineyard",
				"start_time": 16 * 60 * 60,
				"location": "texmex"
			},
			{"activity": "Dinner with family", "start_time": 19 * 60 * 60, "location": "sushi"},
			{
				"activity": "Watch soccer game on TV",
				"start_time": 21 * 60 * 60,
				"location": "coffee"
			},
			{"activity": "Back home", "start_time": 23 * 60 * 60, "location": "green apartment"}
		]
	},
	{
		"general":
		{
			"name": "Mia Johnson",
			"relationship_status": "single",
			"age": "28",
			"sex": "female",
			"origin_country_adjective": "British",
			"shirt_color": "yellow",
			"pants_color": "blue",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You are a passionate traveler and love exploring new cultures.",
			"You enjoy playing video games and can't stop talking about your favorite ones.",
			"You are an animal lover and volunteer at a local shelter.",
			"You are a fitness enthusiast and enjoy trying out new workout routines.",
			"You are a foodie and love trying out new restaurants."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "red apartment"
			},
			{"activity": "Morning yoga session", "start_time": 7 * 60 * 60, "location": "gym"},
			{"activity": "Breakfast at a cafe", "start_time": 8 * 60 * 60, "location": "coffee"},
			{
				"activity": "Work at the travel agency",
				"start_time": 9 * 60 * 60,
				"location": "travel agency"
			},
			{"activity": "Lunch with a friend", "start_time": 12 * 60 * 60, "location": "ramen"},
			{
				"activity": "Visit the animal shelter",
				"start_time": 14 * 60 * 60,
				"location": "market"
			},
			{
				"activity": "Gaming session with friends",
				"start_time": 16 * 60 * 60,
				"location": "coffee"
			},
			{
				"activity": "Dinner at a new restaurant",
				"start_time": 19 * 60 * 60,
				"location": "pizza"
			},
			{"activity": "Evening dance class", "start_time": 21 * 60 * 60, "location": "gym"},
			{"activity": "Back home", "start_time": 23 * 60 * 60, "location": "red apartment"}
		]
	},
	{
		"general":
		{
			"name": "Alice Smith",
			"relationship_status": "single",
			"age": "25",
			"sex": "female",
			"origin_country_adjective": "Canadian",
			"shirt_color": "purple",
			"pants_color": "black",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You love to collect rocks and have a vast collection of them.",
			"You are an expert in crafting handmade jewelry.",
			"You have a pet turtle named Squirt.",
			"You enjoy watching documentaries about space and astrophysics."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 7 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Go for a morning jog", "start_time": 7.5 * 60 * 60, "location": "gym"},
			{"activity": "Grab a coffee", "start_time": 8 * 60 * 60, "location": "coffee"},
			{"activity": "Head to work", "start_time": 8.5 * 60 * 60, "location": "law office"},
			{"activity": "Take a lunch break", "start_time": 12 * 60 * 60, "location": "ramen"},
			{"activity": "Get off work", "start_time": 16 * 60 * 60, "location": "law office"},
			{"activity": "Stop by the market", "start_time": 16.5 * 60 * 60, "location": "market"},
			{
				"activity": "Head home and feed Squirt",
				"start_time": 17 * 60 * 60,
				"location": "green apartment"
			},
			{
				"activity": "Work on your rock collection",
				"start_time": 18 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Cook dinner", "start_time": 19 * 60 * 60, "location": "pho"},
			{
				"activity": "Watch a documentary",
				"start_time": 20 * 60 * 60,
				"location": "green apartment"
			},
			{
				"activity": "Relax and read",
				"start_time": 21.5 * 60 * 60,
				"location": "green apartment"
			},
			{"activity": "Go to bed", "start_time": 22.5 * 60 * 60, "location": "green apartment"}
		]
	},
	{
		"general":
		{
			"name": "Bob Johnson",
			"relationship_status": "married",
			"age": "40",
			"sex": "male",
			"origin_country_adjective": "Australian",
			"shirt_color": "orange",
			"pants_color": "grey",
			"hat_color": "none"
		},
		"character_traits":
		[
			"You are an avid collector of unusual stamps from around the world.",
			"You love to play the bagpipes and practice every day.",
			"You have a collection of over 50 different types of hot sauce.",
			"You have a pet tarantula named Rosie."
		],
		"schedule":
		[
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "red apartment"
			},
			{
				"activity": "Go for a morning bike ride",
				"start_time": 6.5 * 60 * 60,
				"location": "gym"
			},
			{"activity": "Grab a coffee", "start_time": 8 * 60 * 60, "location": "coffee"},
			{"activity": "Head to work", "start_time": 8.5 * 60 * 60, "location": "bank"},
			{"activity": "Take a lunch break", "start_time": 12 * 60 * 60, "location": "sushi"},
			{"activity": "Get off work", "start_time": 16.5 * 60 * 60, "location": "bank"},
			{
				"activity": "Practice playing the bagpipes",
				"start_time": 17.5 * 60 * 60,
				"location": "red apartment"
			},
			{"activity": "Feed Rosie", "start_time": 18.5 * 60 * 60, "location": "red apartment"},
			{"activity": "Cook dinner", "start_time": 19.5 * 60 * 60, "location": "pizza"},
			{"activity": "Watch TV", "start_time": 20.5 * 60 * 60, "location": "red apartment"},
			{"activity": "Read a book", "start_time": 21.5 * 60 * 60, "location": "coffee"},
			{"activity": "Go to bed", "start_time": 22.5 * 60 * 60, "location": "red apartment"}
		]
	}
]
