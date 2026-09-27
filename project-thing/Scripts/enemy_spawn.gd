extends StaticBody2D

const BASIC_ENEMY = "basic"
const TANK_ENEMY = "tank"
const SPEED_ENEMY = "speed"

var enemies = [BASIC_ENEMY, TANK_ENEMY, SPEED_ENEMY]

@export var enemy_spawn_timer : Timer
@export var spawn_point : PathFollow2D
@export var basic_scene : PackedScene
@export var tank_scene : PackedScene
@export var speed_scene : PackedScene


func _spawn_enemy() -> void:
	# Choose random enemy from list
	var enemy_type = enemies.pick_random()
	# Spawn enemy based off randomly chosen enemy
	if enemy_type == BASIC_ENEMY:
		var enemy= basic_scene.instantiate()
		add_child(enemy)
		enemy.global_position = spawn_point.global_position

	elif enemy_type == TANK_ENEMY:
		var tank = tank_scene.instantiate()
		add_child(tank)
		tank.global_position = spawn_point.global_position

	elif enemy_type == SPEED_ENEMY:
		var speed = speed_scene.instantiate()
		add_child(speed)
		speed.global_position = spawn_point.global_position
