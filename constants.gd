extends Node

const FOOD_SPOTS = ["pizza", "texmex", "pho"]
const WORK_SPOTS = ["green office", "red office", "blue office"]
const HOME_SPOTS = ["green apartment", "red apartment", "blue apartment"]
const MISC_SPOTS = ["city center"]
const COLORS = {
	"green": Color.GREEN_YELLOW,
	"red": Color.DARK_RED,
	"blue": Color.CADET_BLUE,
	"black": Color.BLACK,
	"white": Color.WHITE,
	"yellow": Color.YELLOW,
	"pink": Color.HOT_PINK,
	"grey": Color.GRAY,
	"purple": Color.PURPLE,
	"none": Color.TRANSPARENT
}


const CHARACTERS = [
{
	"general": {
		"name": "Sarah Lee",
		"relationship_status": "married",
		"age": "25",
		"sex": "female",
		"origin_country_adjective": "Korean",
		"shirt_color": "pink",
		"pants_color": "black",
		"hat_color": "none"
	},
	"character_traits": [
		"You have a sweet tooth and always carry candy around.",
		"You speak Korean fluently and enjoy watching K-dramas.",
		"You wear pink on Wednesdays.",
		"You drive a blue sedan.",
		"You live in a red apartment in the suburbs.",
		"You like bubble tea and fried chicken.",
		"You like sushi.",
		"You really like chocolate."
	],
	"schedule": [
		{
			"activity": "Wake up in the morning",
			"start_time": 7 * 60 * 60,
			"location": "red apartment"
		},
		{
			"activity": "Have breakfast",
			"start_time": 8 * 60 * 60,
			"location": "texmex"
		},
		{
			"activity": "Work at the green office",
			"start_time": 9 * 60 * 60,
			"location": "green office"
		},
		{
			"activity": "Lunch break",
			"start_time": 12 * 60 * 60,
			"location": "pho"
		},
		{
			"activity": "Work at the green office",
			"start_time": 13 * 60 * 60,
			"location": "green office"
		},
		{
			"activity": "Go grocery shopping",
			"start_time": 17 * 60 * 60,
			"location": "red apartment"
		},
		{
			"activity": "Cook dinner",
			"start_time": 18 * 60 * 60,
			"location": "red apartment"
		},
		{
			"activity": "Watch K-drama",
			"start_time": 20 * 60 * 60,
			"location": "red apartment"
		},
		{
			"activity": "Go to bed",
			"start_time": 23 * 60 * 60,
			"location": "red apartment"
		}
	]
},
{
	"general": {
		"name": "Michael Smith",
		"relationship_status": "single",
		"age": "35",
		"sex": "male",
		"origin_country_adjective": "British",
		"shirt_color": "blue",
		"pants_color": "grey",
		"hat_color": "none"
	},
	"character_traits": [
		"You have a dry sense of humor and love puns.",
		"You speak with a British accent and enjoy tea.",
		"You wear blue on Mondays.",
		"You drive a black SUV.",
		"You live in a green apartment.",
		"You like fish and chips and shepherd's pie.",
		"You like Earl Grey tea.",
		"You really like dark chocolate."
	],
	"schedule": [
		{
			"activity": "Wake up in the morning",
			"start_time": 6 * 60 * 60,
			"location": "green apartment"
		},
		{
			"activity": "Have breakfast",
			"start_time": 7 * 60 * 60,
			"location": "texmex"
		},
		{
			"activity": "Go to work at the red office",
			"start_time": 8 * 60 * 60,
			"location": "red office"
		},
		{
			"activity": "Lunch break",
			"start_time": 12 * 60 * 60,
			"location": "pho"
		},
		{
			"activity": "Work at the red office",
			"start_time": 13 * 60 * 60,
			"location": "red office"
		},
		{
			"activity": "Go to the gym",
			"start_time": 17 * 60 * 60,
			"location": "green apartment"
		},
		{
			"activity": "Cook dinner",
			"start_time": 19 * 60 * 60,
			"location": "green apartment"
		},
		{
			"activity": "Watch TV",
			"start_time": 21 * 60 * 60,
			"location": "green apartment"
		},
		{
			"activity": "Go to bed",
			"start_time": 23 * 60 * 60,
			"location": "green apartment"
		}
	]
},
{
	"general": {
		"name": "Juan Rodriguez",
		"relationship_status": "married",
		"age": "40",
		"sex": "male",
		"origin_country_adjective": "Mexican",
		"shirt_color": "yellow",
		"pants_color": "blue",
		"hat_color": "none"
	},
	"character_traits": [
		"You have a big family and love spending time with them.",
		"You speak Spanish fluently and enjoy listening to mariachi music.",
		"You wear yellow on Thursdays.",
		"You drive a red pickup truck.",
		"You live in a blue apartment in the suburbs.",
		"You like tacos and burritos.",
		"You like horchata.",
		"You really like churros."
	],
	"schedule": [
		{
			"activity": "Wake up in the morning",
			"start_time": 6 * 60 * 60,
			"location": "blue apartment"
		},
		{
			"activity": "Have breakfast",
			"start_time": 7 * 60 * 60,
			"location": "texmex"
		},
		{
			"activity": "Go to work at the green office",
			"start_time": 8 * 60 * 60,
			"location": "green office"
		},
		{
			"activity": "Lunch break",
			"start_time": 12 * 60 * 60,
			"location": "pho"
		},
		{
			"activity": "Work at the green office",
			"start_time": 13 * 60 * 60,
			"location": "green office"
		},
		{
			"activity": "Pick up kids from school",
			"start_time": 16 * 60 * 60,
			"location": "blue apartment"
		},
		{
			"activity": "Have dinner with family",
			"start_time": 18 * 60 * 60,
			"location": "blue apartment"
		},
		{
			"activity": "Watch TV with family",
			"start_time": 20 * 60 * 60,
			"location": "blue apartment"
		},
		{
			"activity": "Go to bed",
			"start_time": 23 * 60 * 60,
			"location": "blue apartment"
		}
	]
},
{
	"general": {
		"name": "Emily Jones",
		"relationship_status": "single",
		"age": "28",
		"sex": "female",
		"origin_country_adjective": "Canadian",
		"shirt_color": "purple",
		"pants_color": "black",
		"hat_color": "none"
	},
	"character_traits": [
		"You have a passion for photography and love taking pictures.",
		"You speak French fluently and enjoy listening to indie music.",
		"You wear purple on Fridays.",
		"You drive a yellow convertible.",
		"You live in a red apartment in the city center.",
		"You like sushi and dim sum.",
		"You like green tea.",
		"You really like macarons."
	],
	"schedule": [
		{
			"activity": "Wake up in the morning",
			"start_time": 7 * 60 * 60,
			"location": "red apartment"
		},
		{
			"activity": "Have breakfast",
			"start_time": 8 * 60 * 60,
			"location": "texmex"
		},
		{
			"activity": "Go to work at the blue office",
			"start_time": 9 * 60 * 60,
			"location": "blue office"
		},
		{
			"activity": "Lunch break",
			"start_time": 12 * 60 * 60,
			"location": "pizza"
		},
		{
			"activity": "Work at the blue office",
			"start_time": 13 * 60 * 60,
			"location": "blue office"
		},
		{
			"activity": "Meet friends for drinks",
			"start_time": 18 * 60 * 60,
			"location": "red apartment"
		},
		{
			"activity": "Take photos around the city",
			"start_time": 19 * 60 * 60,
			"location": "city center"
		},
		{
			"activity": "Cook dinner",
			"start_time": 21 * 60 * 60,
			"location": "red apartment"
		},
		{
			"activity": "Watch indie movie",
			"start_time": 22 * 60 * 60,
			"location": "red apartment"
		},
		{
			"activity": "Go to bed",
			"start_time": 23 * 60 * 60,
			"location": "red apartment"
		}
	]
}]
