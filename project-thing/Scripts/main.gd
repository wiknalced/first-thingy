extends Node2D

@export var enemy_spawn_1: StaticBody2D
@export var enemy_spawn_2 : StaticBody2D
@export var enemy_spawn_timer: Timer
@export var pause_menu : Control
@onready var generator_timer = $Timer2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _enemy_timer() -> void:
	var spawn_number = randi_range(1,2)
	print(spawn_number) #ALERT delete later
	if spawn_number == 1:
		enemy_spawn_1._spawn_enemy()
	else:
		enemy_spawn_2._spawn_enemy()
	enemy_spawn_timer.start()

func _pause_press() -> void:
	pause_menu.pause()
