extends Control

var page_2 = get_tree().call_deferred("change_scene_to_file", "res://scenes/tutorial_2.tscn"
	)
var page_3 = get_tree().call_deferred("")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _skip_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn"
	)
func _next_page() -> void:
	page_2
