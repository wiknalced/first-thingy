extends StaticBody2D

var health : int = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _hit(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("enemy"):
		take_damage()

func take_damage() -> void:
	if health > 1:
		health -= 1
		print(health)
	else: 
		get_tree().call_deferred("reload_current_scene")
