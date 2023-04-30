extends Node

const FOOD_DRINK_SPOTS = ["pizza", "texmex", "pho", "sushi", "burger", "bbq", "ramen", "coffee"]
const WORK_SPOTS = ["bank", "law office", "travel agency"]
const HOME_SPOTS = ["green apartment", "red apartment", "blue apartment"]
const MISC_SPOTS = ["city center", "gym", "market"]
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
	"brown": Color.SADDLE_BROWN,
	"none": Color.TRANSPARENT
}


const CHARACTERS = [
   {
	  "general":{
		 "name":"Alice Smith",
		 "relationship_status":"married",
		 "age":"28",
		 "sex":"female",
		 "origin_country_adjective":"Canadian",
		 "shirt_color":"purple",
		 "pants_color":"black",
		 "hat_color":"red"
	  },
	  "character_traits":[
		 "You are a vegetarian who loves to read mystery novels.",
		 "You have a fear of heights.",
		 "You play the guitar in your spare time.",
		 "You prefer tea over coffee.",
		 "You like to watch TV shows about true crime."
	  ],
	  "schedule":[
		 {
			"activity":"Wake up in the morning",
			"start_time":6 * 60 * 60,
			"location":"green apartment"
		 },
		 {
			"activity":"Morning jog",
			"start_time":7 * 60 * 60,
			"location":"gym"
		 },
		 {
			"activity":"Breakfast at cafe",
			"start_time":8 * 60 * 60 + 30 * 60,
			"location":"coffee"
		 },
		 {
			"activity":"Work at law office",
			"start_time":9 * 60 * 60,
			"location":"law office"
		 },
		 {
			"activity":"Lunch at ramen restaurant",
			"start_time":12 * 60 * 60 + 30 * 60,
			"location":"ramen"
		 },
		 {
			"activity":"Continue working at law office",
			"start_time":13 * 60 * 60,
			"location":"law office"
		 },
		 {
			"activity":"Guitar practice at home",
			"start_time":17 * 60 * 60,
			"location":"green apartment"
		 },
		 {
			"activity":"Dinner at vegan restaurant",
			"start_time":19 * 60 * 60,
			"location":"texmex"
		 },
		 {
			"activity":"Watch TV shows",
			"start_time":21 * 60 * 60,
			"location":"green apartment"
		 },
		 {
			"activity":"Go to bed",
			"start_time":23 * 60 * 60,
			"location":"green apartment"
		 }
	  ]
   },
   {
	  "general":{
		 "name":"Bob Johnson",
		 "relationship_status":"single",
		 "age":"35",
		 "sex":"male",
		 "origin_country_adjective":"British",
		 "shirt_color":"red",
		 "pants_color":"blue",
		 "hat_color":null
	  },
	  "character_traits":[
		 "You are a technology enthusiast who enjoys playing video games.",
		 "You have a passion for cooking and love trying out new recipes.",
		 "You prefer beer over wine or cocktails.",
		 "You like to read science fiction novels.",
		 "You like to watch action movies."
	  ],
	  "schedule":[
		 {
			"activity":"Wake up in the morning",
			"start_time":7 * 60 * 60,
			"location":"red apartment"
		 },
		 {
			"activity":"Morning yoga",
			"start_time":8 * 60 * 60,
			"location":"gym"
		 },
		 {
			"activity":"Breakfast at coffee shop",
			"start_time":9 * 60 * 60,
			"location":"coffee"
		 },
		 {
			"activity":"Go to work at bank",
			"start_time":10 * 60 * 60,
			"location":"bank"
		 },
		 {
			"activity":"Lunch at BBQ restaurant",
			"start_time":12 * 60 * 60 + 30 * 60,
			"location":"bbq"
		 },
		 {
			"activity":"Continue working at bank",
			"start_time":13 * 60 * 60,
			"location":"bank"
		 },
		 {
			"activity":"Grocery shopping",
			"start_time":17 * 60 * 60,
			"location":"market"
		 },
		 {
			"activity":"Cooking dinner",
			"start_time":18 * 60 * 60,
			"location":null
		 },
		 {
			"activity":"Dinner with friends at sushi restaurant",
			"start_time":20 * 60 * 60,
			"location":"sushi"
		 },
		 {
			"activity":"Play video games at home",
			"start_time":22 * 60 * 60,
			"location":"red apartment"
		 },
		 {
			"activity":"Go to bed",
			"start_time":23 * 60 * 60 + 30 * 60,
			"location":"red apartment"
		 }
	  ]
   },
   {
	  "general":{
		 "name":"Sarah Lee",
		 "relationship_status":"single",
		 "age":"25",
		 "sex":"female",
		 "origin_country_adjective":"Korean",
		 "shirt_color":"yellow",
		 "pants_color":"black",
		 "hat_color":null
	  },
	  "character_traits":[
		 "You are a bookworm who loves to read romance novels.",
		 "You have a sweet tooth and enjoy baking desserts.",
		 "You like to watch Korean dramas.",
		 "You prefer tea over coffee.",
		 "You are quiet and introverted."
	  ],
	  "schedule":[
		 {
			"activity":"Wake up in the morning",
			"start_time":8 * 60 * 60,
			"location":"blue apartment"
		 },
		 {
			"activity":"Morning stretch",
			"start_time":9 * 60 * 60,
			"location":null
		 },
		 {
			"activity":"Breakfast at cafe",
			"start_time":10 * 60 * 60,
			"location":"coffee"
		 },
		 {
			"activity":"Go to work at travel agency",
			"start_time":11 * 60 * 60,
			"location":"travel agency"
		 },
		 {
			"activity":"Lunch at pho restaurant",
			"start_time":13 * 60 * 60,
			"location":"pho"
		 },
		 {
			"activity":"Continue working at travel agency",
			"start_time":14 * 60 * 60,
			"location":"travel agency"
		 },
		 {
			"activity":"Baking at home",
			"start_time":17 * 60 * 60,
			"location":"blue apartment"
		 },
		 {
			"activity":"Dinner at pizza restaurant",
			"start_time":19 * 60 * 60,
			"location":"pizza"
		 },
		 {
			"activity":"Watch Korean drama",
			"start_time":21 * 60 * 60,
			"location":"blue apartment"
		 },
		 {
			"activity":"Reading romance novel",
			"start_time":22 * 60 * 60,
			"location":"blue apartment"
		 },
		 {
			"activity":"Go to bed",
			"start_time":23 * 60 * 60,
			"location":"blue apartment"
		 }
	  ]
   },
   {
	  "general":{
		 "name":"Seamus O'Connell",
		 "relationship_status":"single",
		 "age":"32",
		 "sex":"male",
		 "origin_country_adjective":"Irish",
		 "shirt_color":"green",
		 "pants_color":"brown",
		 "hat_color":"blue"
	  },
	  "character_traits":[
		 "You are a football fan with a difficult to understand Irish accent who can only speak in football analogies.",
		 "You love to cook traditional Irish dishes.",
		 "You drive a sports car.",
		 "You like to drink Guinness and watch rugby matches.",
		 "You like to listen to traditional Irish music."
	  ],
	  "schedule":[
		 {
			"activity":"Wake up in the morning",
			"start_time":6 * 60 * 60,
			"location":"green apartment"
		 },
		 {
			"activity":"Morning jog",
			"start_time":7 * 60 * 60,
			"location":"gym"
		 },
		 {
			"activity":"Breakfast at cafe",
			"start_time":8 * 60 * 60 + 30 * 60,
			"location":"coffee"
		 },
		 {
			"activity":"Go to work at bank",
			"start_time":9 * 60 * 60,
			"location":"bank"
		 },
		 {
			"activity":"Lunch at BBQ restaurant",
			"start_time":12 * 60 * 60 + 30 * 60,
			"location":"bbq"
		 },
		 {
			"activity":"Continue working at bank",
			"start_time":13 * 60 * 60,
			"location":"bank"
		 },
		 {
			"activity":"Go to grocery store",
			"start_time":17 * 60 * 60,
			"location":"market"
		 },
		 {
			"activity":"Cook dinner at home",
			"start_time":18 * 60 * 60,
			"location":"green apartment"
		 },
		 {
			"activity":"Watch rugby match at pub",
			"start_time":20 * 60 * 60,
			"location":"coffee"
		 },
		 {
			"activity":"Listen to Irish music",
			"start_time":22 * 60 * 60,
			"location":"green apartment"
		 },
		 {
			"activity":"Go to bed",
			"start_time":23 * 60 * 60,
			"location":"green apartment"
		 }
	  ]
   },
   {
	  "general":{
		 "name":"Helena Rodriguez",
		 "relationship_status":"married",
		 "age":"27",
		 "sex":"female",
		 "origin_country_adjective":"Spanish",
		 "shirt_color":"red",
		 "pants_color":"black",
		 "hat_color":"pink"
	  },
	  "character_traits":[
		 "You speak with a heavy Spanish accent and love to use idioms.",
		 "You enjoy dancing flamenco in your free time.",
		 "You have a passion for cooking paella and other traditional Spanish dishes.",
		 "You like to drink red wine and eat olives.",
		 "You are very superstitious and carry a lucky charm with you at all times."
	  ],
	  "schedule":[
		 {
			"activity":"Wake up in the morning",
			"start_time":6 * 60 * 60,
			"location":"blue apartment"
		 },
		 {
			"activity":"Morning run",
			"start_time":7 * 60 * 60,
			"location":"gym"
		 },
		 {
			"activity":"Breakfast at cafe",
			"start_time":8 * 60 * 60 + 30 * 60,
			"location":"coffee"
		 },
		 {
			"activity":"Go to work at law office",
			"start_time":9 * 60 * 60,
			"location":"law office"
		 },
		 {
			"activity":"Lunch at tapas restaurant",
			"start_time":12 * 60 * 60 + 30 * 60,
			"location":"texmex"
		 },
		 {
			"activity":"Continue working at law office",
			"start_time":13 * 60 * 60,
			"location":"law office"
		 },
		 {
			"activity":"Flamenco dance practice at home",
			"start_time":17 * 60 * 60,
			"location":"blue apartment"
		 },
		 {
			"activity":"Cook dinner with family",
			"start_time":19 * 60 * 60,
			"location":"red apartment"
		 },
		 {
			"activity":"Drink wine and eat olives with friends at bar",
			"start_time":21 * 60 * 60,
			"location":"coffee"
		 },
		 {
			"activity":"Watch Spanish soap opera on TV",
			"start_time":22 * 60 * 60,
			"location":"red apartment"
		 },
		 {
			"activity":"Go to bed",
			"start_time":23 * 60 * 60,
			"location":"red apartment"
		 }
	  ]
   },
   {
	  "general":{
		 "name":"Gustav Svensson",
		 "relationship_status":"single",
		 "age":"30",
		 "sex":"male",
		 "origin_country_adjective":"Swedish",
		 "shirt_color":"blue",
		 "pants_color":"gray",
		 "hat_color":null
	  },
	  "character_traits":[
		 "You have a thick Swedish accent and often mix up English words.",
		 "You are a big fan of ABBA and love to sing their songs.",
		 "You enjoy playing ice hockey in your free time.",
		 "You like to drink coffee and eat cinnamon rolls.",
		 "You have a pet moose named Sven."
	  ],
	  "schedule":[
		 {
			"activity":"Wake up in the morning",
			"start_time":6 * 60 * 60,
			"location":"blue apartment"
		 },
		 {
			"activity":"Morning skate on frozen lake",
			"start_time":7 * 60 * 60,
			"location":"gym"
		 },
		 {
			"activity":"Breakfast at cafe",
			"start_time":8 * 60 * 60 + 30 * 60,
			"location":"coffee"
		 },
		 {
			"activity":"Go to work at travel agency",
			"start_time":9 * 60 * 60,
			"location":"travel agency"
		 },
		 {
			"activity":"Lunch at sushi restaurant",
			"start_time":12 * 60 * 60 + 30 * 60,
			"location":"sushi"
		 },
		 {
			"activity":"Continue working at travel agency",
			"start_time":13 * 60 * 60,
			"location":"travel agency"
		 },
		 {
			"activity":"Play ice hockey with friends",
			"start_time":16 * 60 * 60,
			"location":"gym"
		 },
		 {
			"activity":"Feed Sven the moose",
			"start_time":18 * 60 * 60,
			"location":"blue apartment"
		 },
		 {
			"activity":"Dinner at pizza restaurant",
			"start_time":19 * 60 * 60 + 30 * 60,
			"location":"pizza"
		 },
		 {
			"activity":"Sing karaoke at bar",
			"start_time":21 * 60 * 60,
			"location":"coffee"
		 },
		 {
			"activity":"Watch ABBA concert DVD at home",
			"start_time":22 * 60 * 60,
			"location":"blue apartment"
		 },
		 {
			"activity":"Go to bed",
			"start_time":23 * 60 * 60,
			"location":"blue apartment"
		 }
	  ]
   },
	{
		"general": {
			"name": "Mia Chen",
			"relationship_status": "single",
			"age": "25",
			"sex": "female",
			"origin_country_adjective": "Taiwanese",
			"shirt_color": "yellow",
			"pants_color": "black",
			"hat_color": null
		},
		"character_traits": [
			"You have a Taiwanese accent and are fluent in Mandarin and English.",
			"You enjoy playing video games in your free time.",
			"You have a passion for cooking and baking Taiwanese food.",
			"You like to drink bubble tea and eat shaved ice.",
						"You listen to pop music."
		],
		"schedule": [
			{
				"activity": "Wake up in the morning",
				"start_time": 6 * 60 * 60,
				"location": "red apartment"
			},
			{
				"activity": "Morning jog at park",
				"start_time": 7 * 60 * 60,
				"location": "gym"
			},
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
			{
				"activity": "Go to bed",
				"start_time": 23 * 60 * 60,
				"location": "red apartment"
			}
		]
		},
	
		{
				"general": {
						"name": "Adam Johnson",
						"relationship_status": "married",
						"age":"35",
						"sex":"male",
						"origin_country_adjective":"American",
						"shirt_color":"white",
						"pants_color":"blue",
						"hat_color":"black"
				},
				"character_traits":[
						"You speak with an American accent and love to use idioms.",
						"You enjoy playing basketball in your free time.",
						"You have a passion for cooking and grilling meat.",
						"You like to drink beer and eat buffalo wings.",
						"You listen to country music."
				],
				"schedule":[
						{
								"activity":"Wake up in the morning",
								"start_time":6 * 60 * 60,
								"location":"green apartment"
						},
						{
								"activity":"Morning workout at gym",
								"start_time":7 * 60 * 60,
								"location":"gym"
						},
						{
								"activity":"Breakfast at diner",
								"start_time":8 * 60 * 60 + 30 * 60,
								"location":"coffee"
						},
						{
								"activity":"Go to work at bank",
								"start_time":9 * 60 * 60,
								"location":"bank"
						},
						{
								"activity":"Lunch at burger restaurant",
								"start_time":12 * 60 * 60 + 30 * 60,
								"location":"burger"
						},
						{
								"activity":"Continue working at bank",
								"start_time":13 * 60 * 60,
								"location":"bank"
						},
						{
								"activity":"Grill meat for dinner with family",
								"start_time":17 * 60 * 60,
								"location":"blue apartment"
						},
						{
								"activity":"Drink beer and eat buffalo wings with friends at bar",
								"start_time":19 * 60 * 60,
								"location":"coffee"
						},
						{
								"activity":"Play basketball with friends",
								"start_time":21 * 60 * 60,
								"location":"gym"
						},
						{
								"activity":"Listen to country music and relax at home",
								"start_time":22 * 60 * 60,
								"location":"green apartment"
						},
						{
								"activity":"Go to bed",
								"start_time":23 * 60 * 60,
								"location":"green apartment"
						}
				]
		},
	
		{
				"general": {
						"name": "Yuki Nakamura",
						"relationship_status": "single",
						"age": "28",
						"sex": "female",
						"origin_country_adjective": "Japanese",
						"shirt_color": "pink",
						"pants_color": "white",
						"hat_color": null
				},
				"character_traits":[
						"You have a Japanese accent and often mix up English words.",
						"You enjoy playing the piano in your free time.",
						"You have a passion for cooking and eating sushi.",
						"You like to drink green tea and eat mochi.",
						"You have a pet cat named Sakura."
				],
				"schedule":[
						{
								"activity":"Wake up in the morning",
								"start_time":6 * 60 * 60,
								"location":"blue apartment"
						},
						{
								"activity":"Morning meditation at temple",
								"start_time":7 * 60 * 60,
								"location":"gym"
						},
						{
								"activity":"Breakfast at sushi restaurant",
								"start_time":8 * 60 * 60 + 30 * 60,
								"location":"sushi"
						},
						{
								"activity":"Go to work at tech company",
								"start_time":9 * 60 * 60,
								"location":"law office"
						},
						{
								"activity":"Lunch at ramen restaurant",
								"start_time":12 * 60 * 60 + 30 * 60,
								"location":"ramen"
						},
						{
								"activity":"Continue working at tech company",
								"start_time":13 * 60 * 60,
								"location":"law office"
						},
						{
								"activity":"Practice piano at home",
								"start_time":18 * 60 * 60,
								"location":"blue apartment"
						},
						{
								"activity":"Cook dinner and eat with friends at BBQ restaurant",
								"start_time":19 * 60 * 60,
								"location":"bbq"
						},
						{
								"activity":"Drink green tea and eat mochi with friends",
								"start_time":21 * 60 * 60,
								"location":"coffee"
						},
						{
								"activity":"Watch cat videos and relax at home",
								"start_time":22 * 60 * 60,
								"location":"blue apartment"
						},
						{
								"activity":"Go to bed",
								"start_time":23 * 60 * 60,
								"location":"blue apartment"
						}
				]
		}
]
