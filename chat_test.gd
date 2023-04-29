# Extend the Node2D class
extends Control

# Define variables for user name and AI name
var user_name = 'Player'
var GPT3 = 'GPT-3'

# Define text and input variables
var text = "Who is the biggest prick in the Slovakia?"
var input = text

# Get the nodes for chat log, input label, and input field
#onready var chatLog = get_node("VBoxContainer/RichTextLabel")
@onready var inputField = get_node("TextEdit")

# Define API key and URL for OpenAI GPT-3
var api_key = "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"
var api_url = "https://api.openai.com/v1/engines/davinci-codex/completions"
var request = null
var response = null

# Connect the "text_submitted" signal to the "text_entered" method when the node is ready
func _ready():
	print("bacov kokot")
	#inputField.connect("text_set", Callable(self, 'text_entered'))
	inputField.connect("text_changed", Callable(self, 'kokot'))


# Add a message to the chat log
#func add_message(username, text, group = 0, color = ''):
	#chatLog.bbcode_text += '\n' 

	#if username != '':
	#	chatLog.bbcode_text += '[' + username + ']: '
	#chatLog.bbcode_text += text

func kokot():
	print("im here")

# Method to make a POST request to the OpenAI API
func _make_post_request(url, data_to_send, use_ssl):
	var endpoint = "https://api.openai.com/v1/engines/davinci-codex/completions?input=" + input + "&api_key=" + api_key
	var query = JSON.stringify(input)
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(endpoint, headers, true, HTTPClient.METHOD_POST, query)

# Method called when text is submitted in the input field
func text_entered(text):
	print(text)
	var endpoint = "https://api.openai.com/v1/engines/davinci-codex/completions?input=" + input + "&api_key=" + api_key
	var request = HTTPRequest.new()
	var data_to_send = {
		"api_key": api_key,
		"input": input,
	}
	
	if text != '':
		_make_post_request(endpoint, data_to_send, true)
		#add_message(user_name, text)
		print(input)
		request = HTTPRequest.new()
		var headers = ["Content-Type: application/json"]
		request.request(endpoint, headers, HTTPClient.METHOD_POST, JSON.stringify(data_to_send))
		request.connect("request_completed", Callable(self, "_on_request_completed"))
		print(request)
		inputField.clear()

# Method called when the HTTP request is completed
func _on_request_completed(result, response_code, headers, body):
	if result == HTTPRequest.RESULT_SUCCESS:
		print("Request successful! Response code: ", response_code)
		response = JSON.parse_string(body)
		print("Response: ", response)
	else:
		print("Request failed: ", response_code)
