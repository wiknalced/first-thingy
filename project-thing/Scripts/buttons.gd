extends TextureButton

const FOR_HALF = 2

const TWEEN_DURATION = 0.1
const TWEEN_OFFSET = 4
const TWEEN_SCALE = 0.95

@onready var original_position : Vector2 = position
@onready var original_scale : Vector2 = scale

# Makes sure central point of node is in the centre
func _ready() -> void:
	pivot_offset = size/FOR_HALF


# Button animation when mouse hovers over it to give visual feedback.
func _on_mouse_entered() -> void:
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "position:y", original_position.y + TWEEN_OFFSET, TWEEN_DURATION)
	tween.tween_property(self, "scale", original_scale * TWEEN_SCALE, TWEEN_DURATION)
	tween.tween_property(self, "modulate", Color(0.8, 0.8, 0.8), TWEEN_DURATION )


# Makes button back to orginal when hovered mouse exits for visual feedback.
func _on_mouse_exited() -> void:
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "position:y", original_position.y, TWEEN_DURATION)
	tween.tween_property(self, "scale", original_scale, TWEEN_DURATION)
	tween.tween_property(self, "modulate", Color(1, 1, 1), TWEEN_DURATION)
