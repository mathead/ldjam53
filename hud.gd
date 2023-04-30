extends Control

var question_scene = preload("res://question.tscn")
var answer_scene = preload("res://answer.tscn")

var focused = false
var answer = ""
var answer_start = 0
var delivery_text = ""
var delivery_start = 0
var time = 30000.0
var battery = 100
var lives = 3
@export var time_speed = 200
@onready var BuildingShader = preload("res://Environment/BuildingMaterial.tres")

func _ready():
	%TextPanel.scale.y = 0
	%AnswerPanel.scale.y = 0
	Gpt.connect("gpt_answer", _on_chat_gpt_answer)

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
		%TextEdit.text = ""
		focused = false
	elif Input.is_action_just_pressed("click"):
		focused = %Phone.get_global_rect().has_point(get_global_mouse_position())

	if focused:
		focus()
	else:
		unfocus()

func focus():
	%TextEdit.grab_focus()
	%TextEdit.placeholder_text = "Type your question and press [enter] to submit..."
	%Phone.modulate.a = 0.7
	
func unfocus():
	%TextEdit.release_focus()
	%TextEdit.placeholder_text = "Press [enter] to call the client"
	%Phone.modulate.a = 0.5

func send_query(query):
	### INSERT MAGIC CODE HERE ###
#	%TextPanel.visible = true
#	cool_hide(%TextEdit)
#	%TextEdit.visible = false
	%Loading.visible = true
	var question = question_scene.instantiate()
	question.get_node("PanelContainer/MarginContainer/Text").text = query
	%Chats.add_child(question)
	%Chats.move_child(%Loading, -1)
	Gpt.ask_gpt(query, format_time())
	await get_tree().process_frame
	%ScrollContainer.scroll_vertical = %ScrollContainer.get_v_scroll_bar().max_value
	battery -= 5
#	%Text.text = query
	
func _on_chat_gpt_answer(response):
#	%TextPanel.visible = false
	%Loading.visible = false

	var answer = answer_scene.instantiate()
	answer.get_node("PanelContainer/MarginContainer/Text").text = "[right]" + response + "[/right]"
	%Chats.add_child(answer)
	await get_tree().process_frame
	%ScrollContainer.scroll_vertical = %ScrollContainer.get_v_scroll_bar().max_value
#	cool_show(%TextEdit)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	answer_start += delta
#	%Answer.text = "[right][fade start=" + str(int(round(answer_start*30))) + " length=10]" + answer + "[/fade][/right]"
#	%Answer.modulate.a = min(0.75, len(answer)/12.0 - answer_start + 1)
#	if %Answer.modulate.a <= 0:
#		answer = ""
	var dtime = int(time) % (60*60*24)
	BuildingShader.set_shader_parameter("dtime", dtime)
	if dtime > 7 * 60 * 60 and dtime < 21 * 60 * 60:
		time += delta * time_speed
	else:
		time += delta * time_speed * 10
	%Time.text = "[right]%s[/right]" % format_time()
	delivery_start += delta
	%DeliveryText.text = "[center][fade start=" + str(int(round(delivery_start*30))) + " length=10]" + delivery_text + "[/fade][/center]"
	%DeliveryText.modulate.a = min(0.75, len(delivery_text)/12.0 - delivery_start + 1)
	battery -= delta / 10
	%Battery.value = battery

func format_time():
	var dtime = int(time) % (60*60*24)
	return "%02d:%02d" % [floori(dtime/60.0/60.0), floori((dtime % (60*60))/60.0)]
	
func cool_hide(o):
	create_tween().tween_property(o, "scale", Vector2(1, 0), 1)

func cool_show(o):
	o.visible = true
	o.modulate.a = 0
	await get_tree().create_timer(5).timeout
	create_tween().tween_property(o, "modulate", Color.WHITE, 1)

func set_delivery_text(t):
	delivery_start = 0
	delivery_text = t

func _on_text_edit_focus_entered():
	focus()

func _on_text_edit_focus_exited():
	unfocus()
