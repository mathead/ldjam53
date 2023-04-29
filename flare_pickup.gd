extends Node2D

@export var num = 3
signal picked

func _on_area_2d_body_entered(body):
	emit_signal("picked")
	body.on_flare_picked(num)
	queue_free()
