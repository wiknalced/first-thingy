extends Node2D

@export var enemy_spawn: StaticBody2D
@export var enemy_spawn_timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	pass

func _enemy_timer() -> void:
	enemy_spawn._spawn_enemy()
	enemy_spawn_timer.start()
