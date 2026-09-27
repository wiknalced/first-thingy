extends "res://Scripts/tutorial.gd"

var previous_page = "res://Scenes/tutorial.tscn"


# Change next page  to updated next page
func _ready() -> void:
	next_page = "res://Scenes/tutorial_3.tscn"


# Change scene to previous page when previous button pressed
func _back_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", previous_page)
