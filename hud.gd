extends Control

var focused = false

func _input(ev):
	if Input.is_action_just_pressed("ui_accept"):
		focused = not focused
		if focused:
			await get_tree().process_frame
			%TextEdit.grab_focus()
			%TextEdit.text = ""
		else:
			send_query(%TextEdit.text)
	elif Input.is_action_just_pressed("ui_cancel"):
		focused = false
	%TextEdit.visible = focused
			
func send_query(query):
	print(query)
