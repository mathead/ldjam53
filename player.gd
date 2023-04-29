extends RigidBody2D

const SPEED = 10000.0
var dead = false

func _physics_process(delta):
	if dead:
		$MainCamera.zoom *= 1 + 0.2*delta
		return
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	if direction:
#		velocity = direction * SPEED
		apply_central_impulse(delta*direction*SPEED)
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED/10)
#		velocity.y = move_toward(velocity.y, 0, SPEED/10)
	
		#	move_and_slide()
			#footsteps sound
		if $Timer.time_left <=0:
			$SFXFootsteps.pitch_scale = randf_range(0.8,1.2)
			$SFXFootsteps.play()
			$Timer.start(0.8)

	
	$Node2D.look_at(get_global_mouse_position())
	var dir = (get_global_mouse_position() - global_position)
	$MainCamera.offset = lerp($MainCamera.offset, dir / 20, 0.05)
	$MainCamera.rotation = lerp($MainCamera.rotation, (dir.x)/30000, 0.05)

func _unhandled_input(event):
	if dead: return

func _on_body_entered(body):
	if dead: return
	if body.is_in_group("ghosts"):
		dead = true
		get_node("/root/Main").set_text("[shake rate=5 level=10][color=red]YOU DIED[/color][/shake]")
		%DeathIcon.visible = true
		$SFXDeath.play()
		await get_tree().create_timer(4).timeout
		get_node("/root/Main").load_level()
	elif body.is_in_group("doors"):
		var s: AudioStreamPlayer2D = body.get_parent().get_node("Sound")
		if not s.playing:
			s.play()
		
