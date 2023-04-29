extends CharacterBody3D

@export var speed = 14.0
@export var fall_acceleration = 75
var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	direction = Vector3(direction.x, 0, direction.y)
	if direction != Vector3.ZERO:
		$Pivot.look_at(position + direction, Vector3.UP)
		
	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()

	#footsteps sound
	if $Timer.time_left <=0:
		$SFXFootsteps.pitch_scale = randf_range(0.8,1.2)
		$SFXFootsteps.play()
		$Timer.start(0.8)


#	$Node2D.look_at(get_global_mouse_position())
#	var dir = (get_global_mouse_position() - global_position)
#	$MainCamera.offset = lerp($MainCamera.offset, dir / 20, 0.05)
#	$MainCamera.rotation = lerp($MainCamera.rotation, (dir.x)/30000, 0.05)

#func _unhandled_input(event):
#	if dead: return
#
#func _on_body_entered(body):
#	if dead: return
#	if body.is_in_group("ghosts"):
#		dead = true
#		get_node("/root/Main").set_text("[shake rate=5 level=10][color=red]YOU DIED[/color][/shake]")
#		%DeathIcon.visible = true
#		$SFXDeath.play()
#		await get_tree().create_timer(4).timeout
#		get_node("/root/Main").load_level()
#	elif body.is_in_group("doors"):
#		var s: AudioStreamPlayer2D = body.get_parent().get_node("Sound")
#		if not s.playing:
#			s.play()
#
