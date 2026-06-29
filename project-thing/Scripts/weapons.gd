extends Area2D

var is_attacking : bool = false
var enemy = CharacterBody2D

@export var is_attack : Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		is_attacking = true
		is_attack.start()
		
	
func _damage_enemy(body: CharacterBody2D) -> void:
	if is_attacking:
		if body.is_in_group("enemy"):
			body.take_damage()
			

func _is_attack() -> void: 
	is_attacking = false
	
