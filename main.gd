extends Node3D

func _process(delta):
	%SunPivot.rotation.z = (%HUD.time / (60*60*24) + 0.4) * 2 * PI
	%Sun.rotation.z = %HUD.time / (60*60*24) * 2 * PI
	%Moon.rotation.z = %HUD.time / (60*60) * 2 * PI
	
	var r = pow(abs(sin(%SunPivot.rotation.z)), 10)
	%Sun.light_color.b = 1 - r
	%Sun.light_color.g = 1 - r / 1.5
	var sunheight = pow(sin(%SunPivot.rotation.z + PI/1.6), 1/3.)
	%Sun.light_energy = max(0.001,sunheight * 2)
