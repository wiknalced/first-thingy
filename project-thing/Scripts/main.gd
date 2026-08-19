extends Node2D

@export var enemy_spawn_1: StaticBody2D
@export var enemy_spawn_2 : StaticBody2D
@export var enemy_spawn_timer: Timer
@onready var generator_timer = $Timer2

var total_enemy: int = 0
var wave_counter : int = 0
var score : int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	pass

func _enemy_timer() -> void:
	if score < 10 and total_enemy < 20:
		var spawn_number = randi_range(1,2)
		if spawn_number == 1:
			enemy_spawn_1._spawn_enemy()
		else:
			enemy_spawn_2._spawn_enemy()
		total_enemy += 1
		enemy_spawn_timer.start()

func _generate() -> void:
	if score < 10:
		score += 1
		print(score)
		generator_timer.start()
	else: 
		print("next_wave")
