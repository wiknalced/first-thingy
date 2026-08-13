extends StaticBody2D

var enemies = ["Basic", "Tank", "Glass"]
var total_enemy : int = 0

@export var enemy_spawn_timer : Timer
@export var spawn_point : PathFollow2D
@export var basic_scene : PackedScene
@export var tank_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _spawn_enemy() -> void:
	var enemy_type = enemies.pick_random()
	if enemy_type == "Basic":
		var enemy= basic_scene.instantiate()
		add_child(enemy)
		enemy.global_position = spawn_point.global_position
	elif enemy_type == "Tank":
		var tank = tank_scene.instantiate()
		add_child(tank)
		tank.global_position = spawn_point.global_position
	
func _enemy_timer() -> void:
	_spawn_enemy()
	enemy_spawn_timer.start()
	
	
	
