extends "res://Scripts/tutorial.gd"

var previous_page = "res://Scenes/tutorial.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_page = "res://Scenes/tutorial_3.tscn"


func _back_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", previous_page
	)
