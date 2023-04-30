extends RigidBody3D

func _ready():
	#%Agent.target_position = get_tree().get_nodes_in_group("starbucks")[0].global_position
	_on_timer_timeout()

func _process(delta):
	var speed = 300
	%Agent.set_velocity(global_position.direction_to(%Agent.get_next_path_position())*delta*speed)
#	position += global_position.direction_to(%Agent.get_next_location())

func velocity_computed(vel):
	vel.y = 0
	if vel.length() > 0.01:
		apply_central_impulse(vel)
		$Pivot.look_at(global_position + vel)

func _on_timer_timeout():
	var places = get_tree().get_nodes_in_group("destination")
	%Agent.target_position = places[randi()%len(places)].global_position
