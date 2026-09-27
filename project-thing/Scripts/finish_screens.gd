extends Control

const GAME_PAGE = "res://scenes/main.tscn"
const MAIN_MENU = "res://scenes/main_menu.tscn"


# Go to main game when button pressed
func _return_home() -> void:
	get_tree().call_deferred("change_scene_to_file", GAME_PAGE)

# Go back to main menu when button pressed
func _play_again() -> void:
	get_tree().call_deferred("change_scene_to_file", MAIN_MENU)
