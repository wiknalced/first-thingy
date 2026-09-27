extends "res://Scripts/tutorial_2.gd"


# Change next page scene to game page
# Update old previous page to new previous page
func _ready() -> void:
	next_page = "res://Scenes/main.tscn"
	previous_page = "res://Scenes/tutorial_2.tscn"
