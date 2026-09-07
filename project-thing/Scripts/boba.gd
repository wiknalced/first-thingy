extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _hit(area: Area2D) -> void:
	if area.is_in_group("player_detect") or area.is_in_group("enemy"):
		queue_free()
