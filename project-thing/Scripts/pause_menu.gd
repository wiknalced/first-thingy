extends Control

const PAUSE_INPUT = "esc"

const MAIN_MENU = "res://scenes/main_menu.tscn"


# Hide pause menu at the start of scene
func _ready() -> void:
	hide()


# Pause or Resume based on if scene is already paused or reumed
func _process(delta):
	inputEsc()


# Hide pause menu, resume scene
func resume():
	get_tree().paused = false
	hide()


# Show pause menu, pause scene
func pause():
	show()
	get_tree().paused = true


# Toggle pause state: pause if game already running, resume if already paused 
func inputEsc():
	if Input.is_action_just_pressed(PAUSE_INPUT) and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed(PAUSE_INPUT) and get_tree().paused == true:
		resume()


# Resume when resume button pressed
func _on_resume_box_pressed() -> void:
	resume()


# Restart when restart button pressed
func _on_restart_box_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


# Quit when quit button pressed
func _on_quit_box_pressed() -> void:
	resume()
	get_tree().call_deferred("change_scene_to_file", MAIN_MENU)
