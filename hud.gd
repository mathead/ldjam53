extends Control

var focused = false
var answer = ""
var answer_start = 0

func _ready():
	%TextPanel.scale.y = 0
	%AnswerPanel.scale.y = 0

func _input(ev):
	if Input.is_action_just_pressed("ui_accept"):
		focused = not focused
		if focused:
			await get_tree().process_frame
			%TextEdit.grab_focus()
			%TextEdit.text = ""
		else:
			focused = false
			if %TextEdit.text != "":
				send_query(%TextEdit.text)
			await get_tree().process_frame
			%TextEdit.text = ""
	elif Input.is_action_just_pressed("ui_cancel"):
		focused = false

	if focused:
		%TextEdit.placeholder_text = "Type your question and press [enter] to submit..."
	else:
		%TextEdit.release_focus()
		%TextEdit.placeholder_text = "Press [enter] to call the client"
			
func send_query(query):
	### INSERT MAGIC CODE HERE ###
	%TextPanel.visible = true
#	cool_hide(%TextEdit)
	%TextEdit.visible = false
	%Text.text = query
	$Chat.ask_gpt(query)
	set_answer("...")
	
func _on_chat_gpt_answer(response):
	%TextPanel.visible = false
	set_answer(response)
	cool_show(%TextEdit)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	answer_start += delta
	%Answer.text = "[right][fade start=" + str(int(round(answer_start*30))) + " length=10]" + answer + "[/fade][/right]"
	%Answer.modulate.a = min(0.75, len(answer)/12.0 - answer_start + 1)
	if %Answer.modulate.a <= 0:
		answer = ""

func set_answer(t):
	%AnswerPanel.visible = true
	answer = t
	answer_start = -1
	
func cool_hide(o):
	create_tween().tween_property(o, "scale", Vector2(1, 0), 1)

func cool_show(o):
	o.visible = true
	o.modulate.a = 0
	await get_tree().create_timer(5).timeout
	create_tween().tween_property(o, "modulate", Color.WHITE, 1)
