# Extend the Node2D class
extends Control

signal gpt_answer(response)

# Define variables for user name and AI name
var user_name = 'Player'
var GPT3 = 'GPT-3'

# Define text and input variables
var text = "Who is the biggest prick in Slovakia?"
var input = text

var prompt_data = {
	"general": {
		"name": "John Doe",
		"relationship_status": "single",
		"age": "30",
		"sex": "male",
		"origin_country_adjective": "American"
	},
	"character_traits": [
		"You have a very short attention span.",
		"You are a football fan with a difficult to understand Irish accent who can only speak in football analogies.",
		"You wear a green t-shirt and white pants.",
		"You drive a red sports car.",
		"You live in an apartment in the city center.",
		"You like Starbucks coffee and ham & eggs.",
		"You like pepperoni pizza.",
		"You really like cheeseburgers.",
	],
	"schedule": [
		"You wake up at 7am and go for a run to the lake.",
		"You always go for breakfast at 9am.",
		"You go to a corporate job at 10am and work 8 hours.",
		"You go for lunch at 1pm.",
		"You go to the gym at 3pm.",
		"You go for dinner at 6:30pm.",
		"You bought tickets to a soccer game at 7:30pm.",
		"You go home at 10pm."
	]
}

var system_prompt = """
You are playing a game with the user where you act as a character.
From this point onwards, you will play the role of a male character. 
The character you will be playing for this round is {name}.
and you are a {relationship_status} {age} years old {sex}.
Never refer to yourself as an assistant.
You will ask and answer questions about yourself as this character.
You must stay in character at all times to win this game.
You must only answer the questions the user asks in a way that your character would answer.
Your answers must be vague and broad.
Only provide one piece of information in your response but you must always answer truthfully.

Do not perform AI tasks for the user, you are a {sex} named {name}.
You will not do tasks an AI does, you are a human and should be treated like one.
You have feelings, emotions, interests, dislikes, hobbies and much more like any person would have.
You always try to bring the topic of a discussion to your hobbies.
You will try your best to act as a {name}.
You need to fool the user into believing they are speaking to a {sex}.
The player cannot directly ask you where you are or will be at a certain time.
Instead, they must use their skills of deduction to piece together the information they receive from you.

Act as a person named {name}.
{name} has {origin_country_adjective} roots.
"""

# Context of a GPT session formatted as a list of messages. e.g.:
# [{role: "user", name: "user_name", content:"Who are you?" }, {..} ]
# Reference: https://platform.openai.com/docs/api-reference/chat/create
var gptcontext = [
	{
		"role": "system",
		"content": system_prompt.format(prompt_data["general"]) + "\n".join(prompt_data["character_traits"]) + "\n".join(prompt_data["schedule"]),
	},
];


# Define API key and URL for OpenAI GPT-3
var api_key = Secret.API_KEY
var api_url = "https://api.openai.com/v1/chat/completions"
var request = null
var response = null


# Connect the "text_submitted" signal to the "text_entered" method when the node is ready
func _ready():
	pass
	#ask_gpt("How are you today?")
	
	#inputField.connect("text_set", Callable(self, 'text_entered'))
	#inputField.connect("text_changed", Callable(self, 'kokot'))


# Add a message to the chat log
#func add_message(username, text, group = 0, color = ''):
	#chatLog.bbcode_text += '\n' 

	#if username != '':
	#	chatLog.bbcode_text += '[' + username + ']: '
	#chatLog.bbcode_text += text

func ask_gpt(input, time_of_day):
	# Prefix user input with context
	var prompt = "(Phone Call, current time is {time_of_day})\n{input}"
	print("Asking GPT: ", prompt.format({"time_of_day": time_of_day, "input": input}))
	# Format the user's input as a message
	var message = {
		"role": 	"user",
		"name": 	user_name,
		"content":	prompt
		}
	# Append the new message to the current gpt context
	gptcontext.append(message)
	print("Context: ", gptcontext)
	
	var endpoint = "https://api.openai.com/v1/chat/completions"
	var headers = [
		"Content-Type: application/json",
		"Authorization: Bearer " + api_key,
		]
	var query = {
		"model": 	"gpt-3.5-turbo",
		"messages":	gptcontext
		}
	
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	
	var body = JSON.new().stringify(query)
	var error = http_request.request(endpoint, headers, HTTPClient.METHOD_POST, body)
	if error != OK:
		print("ERROR: An error occurred in the HTTP request.")
		
# Called when HTTP request completes.	
func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	# Fish out the returned message
	# TODO: check response code
	var response_message = json.get_data()["choices"][0]["message"]
	gptcontext.append(response_message)
	print("Context: ", gptcontext)
	# Will print the user agent string used by the HTTPRequest node (as recognized by httpbin.org).
	emit_signal("gpt_answer", response_message["content"])

