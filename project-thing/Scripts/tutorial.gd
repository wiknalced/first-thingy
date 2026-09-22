extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = size/2 # ALERT: magic number

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _skip_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn"
	)
func _next_page() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/tutorial_2.tscn"
	)
	
func _mouse_entered() -> void:
	position.y = position.y + 4
	scale = Vector2(0.95,0.95)
	modulate = Color(0.8, 0.8, 0.8)

func _mouse_exit() -> void:
	position.y = position.y - 4
	scale = Vector2(1.0,1.0)
	modulate = Color(1.0,1.0,1.0)
