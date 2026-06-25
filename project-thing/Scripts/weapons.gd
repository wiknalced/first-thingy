extends Area2D

var enemy = CharacterBody2D
var enemy_range : CharacterBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if enemy_range:
			enemy_range.take_damage()
			print("damage")

func _enemy_in_range(body: CharacterBody2D) -> void:
	if body.is_in_group("enemy"):
		enemy_range = body

func _enemy_out_range(body: CharacterBody2D) -> void:
	if body.is_in_group("enemy"):
		enemy_range = null
