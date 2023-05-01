extends Node3D

var npc_scene = preload("res://npc.tscn")
var level = 0

func _ready():
	reset_level()
	%HUD.time_speed *= 50

func _process(delta):
	%SunPivot.rotation.z = (%HUD.time / (60*60*24) + 0.4) * 2 * PI
	%Sun.rotation.z = %HUD.time / (60*60*24) * 2 * PI
	%Moon.rotation.z = %HUD.time / (60*60) * 2 * PI
	
	var r = pow(abs(sin(%SunPivot.rotation.z + PI/20)), 10)
	%Sun.light_color.b = 1 - r
	%Sun.light_color.g = 1 - r / 1.5
	var sunheight = pow(sin(%SunPivot.rotation.z + PI/1.9), 1/3.)
	%Sun.light_energy = max(0.001,sunheight * 2)

func next_level():
	level += 1
	reset_level()
	
func reset_level():
	get_tree().call_group("npc", "queue_free")
	var cur_level
	if level >= len(Constants.LEVELS):
		%HUD.delivery_text = "You won! Thanks for playing! You took " + str(Time.get_ticks_msec() / 1000 / 60) + "m" + str(int(Time.get_ticks_msec() / 1000) % 60) + "s to deliver all " + str(level) + " packages. You can continue playing in infinite mode."
		%HUD.delivery_start = 0
		cur_level = {
			"character": Constants.CHARACTERS.ALL,
			"num_people": len(Constants.CHARACTERS.ALL)
		}
	else:
		cur_level = Constants.LEVELS[level]
	var cur_character = cur_level["character"][randi()%len(cur_level["character"])]
	Characters.ALL.shuffle()

	for char in Characters.ALL:
		if char["general"]["name"] == cur_character["general"]["name"]:
			var npc = npc_scene.instantiate()
			npc.character = Gpt.jitter_schedule(char)
			npc.character["character_traits"] += cur_level["traits"]
			npc.active = true
#			npc.position = Vector3(randf() * 100, 0, randf() * 100)
			add_child(npc)
			Gpt.set_active_character(npc)
			%HUD.new_delivery(npc)
			break
			
	for i in range(cur_level["num_people"]):
		if Characters.ALL[i]["general"]["name"] == cur_character["general"]["name"]:
			continue
		var npc = npc_scene.instantiate()
		npc.character = Gpt.jitter_schedule(Characters.ALL[i])
#		npc.position = Vector3(randf() * 100, 0, randf() * 100)
		add_child(npc)


func _on_timer_timeout():
	$FX.play()
	%FXTimer.wait_time = 10 + randf() * 5

func _on_start_button_pressed():
	reset_level()
	%HUD.visible = true
	create_tween().tween_property(%HUD, "time_speed", %HUD.time_speed_normal, 3).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	$StartScreen.queue_free()
	%HUD.delivery_text = "Time for your first delivery! Text the recipient to find out where they are and how they look."
	%HUD.delivery_start = 0
