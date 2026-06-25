extends StaticBody2D

@export var spawn_point : PathFollow2D
@export var enemy_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _spawn_enemy() -> void:
	var enemy= enemy_scene.instantiate()
	add_child(enemy)
	enemy.global_position = spawn_point.global_position
	
	
