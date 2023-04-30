extends Node3D

var npc_scene = preload("res://npc.tscn")
var level = -1

func _ready():
	next_level()

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
	get_tree().call_group("npc", "queue_free")
	
	level += 1
	var c = Constants.LEVELS[level]
	Constants.CHARACTERS.shuffle()

	for char in Constants.CHARACTERS:
		if char["general"]["name"] == c["character"]:
			var npc = npc_scene.instantiate()
			npc.character = Gpt.jitter_schedule(char)
			npc.active = true
			npc.position = Vector3(randf() * 100, 0, randf() * 100)
			add_child(npc)
			Gpt.set_active_character(npc)
			%HUD.new_delivery(npc)
			break
			
	for i in range(c["num_people"]):
		if Constants.CHARACTERS[i]["general"]["name"] == c["character"]:
			continue
		var npc = npc_scene.instantiate()
		npc.position = Vector3(randf() * 100, 0, randf() * 100)
		npc.character = Gpt.jitter_schedule(Constants.CHARACTERS[i])
		add_child(npc)
