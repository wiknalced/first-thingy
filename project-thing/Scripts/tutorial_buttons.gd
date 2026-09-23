extends TextureButton



@onready var original_position : Vector2 = position
@onready var original_scale : Vector2 = scale
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "position:y", original_position.y + 4, 0.1)
	tween.tween_property(self, "scale", original_scale * 0.95, 0.1)
	tween.tween_property(self, "modulate", Color(0.8,0.8, 0.8), 0.1)
	print("enter")

func _on_mouse_exited() -> void:
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "position:y", original_position.y, 0.1)
	tween.tween_property(self, "scale", original_scale, 0.1)
	tween.tween_property(self, "modulate", Color(1,1, 1), 0.1)
	print("exit")
