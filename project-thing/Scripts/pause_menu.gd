extends Control

const PAUSE_INPUT = "esc"

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
	if Input.is_action_just_pressed(PAUSE_INPUT) and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed(PAUSE_INPUT) and get_tree().paused == true:
		resume()


func _on_resume_box_pressed() -> void:
	resume()


func _on_restart_box_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_quit_box_pressed() -> void:
	resume()
	get_tree().call_deferred("change_scene_to_file", 
	"res://scenes/main_menu.tscn")
