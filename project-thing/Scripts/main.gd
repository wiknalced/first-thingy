extends Node2D

const SPAWNER_1 : int = 1
const SPAWNER_2 : int = 2

@export var enemy_spawn_1: StaticBody2D
@export var enemy_spawn_2 : StaticBody2D
@export var enemy_spawn_timer: Timer
@export var pause_menu : Control
@onready var generator_timer = $Timer2


# Spawn enemy once timer runs out
func _enemy_timer() -> void:
	# Pick random enemy spawner
	var spawn_number = randi_range(SPAWNER_1,SPAWNER_2)
	
	# Spawn enemy at randomly chosen spawner
	if spawn_number == SPAWNER_1:
		enemy_spawn_1._spawn_enemy()
	else:
		enemy_spawn_2._spawn_enemy()
	
	# Start enemy timer again
	enemy_spawn_timer.start()

# Pause when button pressed
func _pause_press() -> void:
	pause_menu.pause()
