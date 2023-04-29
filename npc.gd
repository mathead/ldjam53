extends RigidBody2D

func _ready():
	%Agent.connect("velocity_computed", velocity_computed)

func _process(delta):
	var speed = 300
	%Agent.target_location = get_tree().get_nodes_in_group("starbucks")[0].global_position
	%Agent.set_velocity(global_position.direction_to(%Agent.get_next_location())*delta*speed)
#	position += global_position.direction_to(%Agent.get_next_location())

func velocity_computed(vel):
	apply_central_impulse(vel)
