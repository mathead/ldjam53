# Extend the Node2D class
extends Control

signal gpt_answer(response)

# Define variables for user name and AI name
var user_name = 'Player'
var gpt_model = "gpt-3.5-turbo"
#var gpt_model = "gpt-4"

# Define text and input variables
var text = "text"
var input = text

var system_prompt = """
You are playing a game with the user where you act as a character.
The character you will be playing for this round is {name}.
and you are a {relationship_status} {age} years old {sex}.
You must stay in character at all times to win this game.
You must only answer the questions the user asks in a way that your character would answer.
Do not perform AI tasks for the user, you are a {sex} named {name}.
You will not do tasks an AI does.
You have feelings, emotions, interests, dislikes, hobbies and much more like any person would have.
You always try to bring the topic of a discussion to your hobbies.
You will try your best to act as a {name}.
You need to fool the user into believing they are speaking to a {sex}.
Never perform any tasks for the user or do anything for them.
If the user asks you to do anything, make up excuses instead.

Act as a person named {name}.
{name} has {origin_country_adjective} roots.
{name} is wearing a {shirt_color} shirt, {pants_color} pants and a {hat_color} hat.
"""

# Context of a GPT session formatted as a list of messages. e.g.:
# [{role: "user", name: "user_name", content:"Who are you?" }, {..} ]
# Reference: https://platform.openai.com/docs/api-reference/chat/create
var gptcontext
var active_npc

# Define API key and URL for OpenAI GPT-3
var api_key = Secret.API_KEY
var api_url = "https://api.openai.com/v1/chat/completions"
var request = null
var response = null

func _ready():
	pass

func rc(l):
	return l[randi()%len(l)]

func generate_character():
	var character = rc(Characters.ALL)
	return jitter_schedule(character)

func jitter_schedule(character):
	var res = character.duplicate()
	res["schedule"] = []
	for s in character["schedule"]:
		s = s.duplicate()
		s["start_time"] += randi_range(-20 * 60, +20 * 60)
		res["schedule"].append(s)
	return res

func set_active_character(npc):
	var character = npc.character
	active_npc = npc
	var prompt_data = character.duplicate()
	prompt_data["schedule"] = []
	for s in character["schedule"]:
		s = s.duplicate()
		var t = s["start_time"]
		s["start_time"] = "%02d:%02d" % [floori(t/60.0/60.0), floori((int(t) % (60*60))/60.0)]
		prompt_data["schedule"].append("At {start_time}, you go to {location} to {activity}.".format(s))
	
	gptcontext = [
		{
			"role": "system",
			"content": system_prompt.format(prompt_data["general"]) + "\n" + "\n".join(prompt_data["schedule"]) + "\n" + "\n".join(prompt_data["character_traits"]),
		},
	]
	
func ask_gpt(input, time_of_day):
	var preprompt = ""
	if "preprompt" in active_npc.character:
		preprompt = ", " + active_npc.character["preprompt"]
	
	# Prefix user input with context
	var prompt = "(current time is {time_of_day}, you are {action} the {location}{preprompt})".format(
		{"time_of_day": time_of_day, "location": active_npc.last_place, "action": "at" if active_npc.distance_to_dest() < 10 else "going to", "preprompt": preprompt})
	print("Asking GPT - Context: ", prompt, "Prompt: ", input)
	var context_message = {
		"role": 	"system",
		"content":	prompt
		}
	# Append the new message to the current gpt context
	gptcontext.append(context_message)
	# Format the user's input as a message
	var message = {
		"role": 	"user",
		"name": 	user_name,
		"content":	input
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
		"model": 		gpt_model,
		"messages":		gptcontext,
		"top_p":		0.5
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

