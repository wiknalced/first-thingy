extends TextureButton

@onready var original_position : Vector2 = position
@onready var original_scale : Vector2 = scale

# Makes sure central point of node is in the centre
func _ready() -> void:
	pivot_offset = size/2


# Button animation when mouse hovers over it to give visual feedback.
func _on_mouse_entered() -> void:
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "position:y", original_position.y + 4, 0.1)
	tween.tween_property(self, "scale", original_scale * 0.95, 0.1)
	tween.tween_property(self, "modulate", Color(0.8,0.8, 0.8), 0.1)

	
# Makes button back to orginal when hovered mouse exits for visual feedback.
func _on_mouse_exited() -> void:
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "position:y", original_position.y, 0.1)
	tween.tween_property(self, "scale", original_scale, 0.1)
	tween.tween_property(self, "modulate", Color(1,1, 1), 0.1)
