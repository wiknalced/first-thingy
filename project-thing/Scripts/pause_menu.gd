extends Control

func _ready() -> void:
	hide()

func _process(delta):
	inputEsc()

func resume():
	get_tree().paused = false
	hide()

func pause():
	show()
	get_tree().paused = true

func inputEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
		print("paused")
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()
		print("paused")
	


func _on_resume_box_pressed() -> void:
	resume()


func _on_restart_box_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_quit_box_pressed() -> void:
	get_tree().quit()
