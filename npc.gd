extends RigidBody3D

var character = Gpt.generate_character()
@onready var hud = get_node("/root/Main/HUD")
var last_place = ""
var active = false

func _ready():
	#%Agent.target_position = get_tree().get_nodes_in_group("starbucks")[0].global_position
	go_to_next_place()
	var hat_mat = %Hat.get_active_material(0).duplicate()
	hat_mat.albedo_color = Constants.COLORS[character["general"]["hat_color"]]  # Color.from_hsv(randf(), 0.8, 1)
	%Hat.set_surface_override_material(0, hat_mat)
	var shirt_mat = %Shirt.get_active_material(0).duplicate()
	shirt_mat.albedo_color = Constants.COLORS[character["general"]["shirt_color"]]  # Color.from_hsv(randf(), 0.8, 1)
	%Shirt.set_surface_override_material(0, shirt_mat)
	var pants_mat = %Pants1.get_active_material(0).duplicate()
	pants_mat.albedo_color = Constants.COLORS[character["general"]["pants_color"]]  # Color.from_hsv(randf(), 0.8, 1)
	%Pants1.set_surface_override_material(0, pants_mat)
	%Pants2.set_surface_override_material(0, pants_mat)

func _process(delta):
	go_to_next_place()
	var speed = 300
	%Agent.set_velocity(global_position.direction_to(%Agent.get_next_path_position())*delta*speed)
#	position += global_position.direction_to(%Agent.get_next_location())

func velocity_computed(vel):
	vel.y = 0
	if vel.length() > 0.01:
		apply_central_impulse(vel)
		$Pivot.look_at(global_position + vel)

func distance_to_dest():
	return %Agent.distance_to_target()

func go_to_next_place():
	var dtime = int(hud.time) % (60*60*24)
	var last = character["schedule"][-1]["location"]
	for s in character["schedule"]:
		if s["start_time"] > dtime:
			break
		last = s["location"]
	if last != last_place:
		last_place = last
		if len(get_tree().get_nodes_in_group(last)) == 0:
			print("can't find " + last)
			return
		%Agent.target_position = get_tree().get_nodes_in_group(last)[0].global_position

func go_to_random_place():
	var places = get_tree().get_nodes_in_group("destination")
	%Agent.target_position = places[randi()%len(places)].global_position


func _on_body_entered(body):
	if body.is_in_group("player"):
		if active:
			hud.set_delivery_text("Yes, that's me, you won!")
		else:
			hud.set_delivery_text("This package is not for me")
