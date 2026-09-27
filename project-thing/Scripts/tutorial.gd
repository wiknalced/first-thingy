extends Control

var next_page = "res://scenes/tutorial_2.tscn"

const GAME_PAGE = "res://scenes/main.tscn"


# Change scene to game when skip all button pressed
func _skip_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", GAME_PAGE)


# Change scene to next page when next button pressed
func _next_page() -> void:
	get_tree().call_deferred("change_scene_to_file", next_page)
