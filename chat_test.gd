# Extend the Node2D class
extends Control

# Define variables for user name and AI name
var user_name = 'Player'
var GPT3 = 'GPT-3'

# Define text and input variables
var text = "Who is the biggest prick in Slovakia?"
var input = text

# Context of a GPT session formatted as a list of messages. e.g.:
# [{role: "user", name: "user_name", content:"Who are you?" }, {..} ]
# Reference: https://platform.openai.com/docs/api-reference/chat/create
var gptcontext = [];

# Get the nodes for chat log, input label, and input field
#onready var chatLog = get_node("VBoxContainer/RichTextLabel")
@onready var inputField = get_node("TextEdit")

# Define API key and URL for OpenAI GPT-3
var api_key = "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"
var api_url = "https://api.openai.com/v1/chat/completions"
var request = null
var response = null

# Connect the "text_submitted" signal to the "text_entered" method when the node is ready
func _ready():
	_ask_gpt("How are you today?")
	
	#inputField.connect("text_set", Callable(self, 'text_entered'))
	#inputField.connect("text_changed", Callable(self, 'kokot'))


# Add a message to the chat log
#func add_message(username, text, group = 0, color = ''):
	#chatLog.bbcode_text += '\n' 

	#if username != '':
	#	chatLog.bbcode_text += '[' + username + ']: '
	#chatLog.bbcode_text += text

func _ask_gpt(prompt):
	print("Asking GPT: ", prompt)
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
		push_error("An error occurred in the HTTP request.")

# Called when HTTP request completes.	
func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	# Fish out the returned message
	var response = json.get_data()["message"]
	
	# Will print the user agent string used by the HTTPRequest node (as recognized by httpbin.org).
	print(response)

