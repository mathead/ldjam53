extends Node3D

func _process(delta):
	%SunPivot.rotation.z = %HUD.time / (60*60*24) * 2 * PI
