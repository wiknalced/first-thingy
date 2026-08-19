extends CharacterBody2D

var enemy = Area2D
var speed: float = 300
var health: int = 5
var can_attack : bool = true

@export var pivot : Node2D
@export var attack_spawn : Marker2D
@export var attack_timer : Timer

func _ready() -> void:
	pass
func _process(_delta) -> void:
	pass

func _physics_process(_delta: float) -> void:
	var direction : Vector2 = Vector2(0.0, 0.0)
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	velocity = speed * direction.normalized()
	move_and_slide()
	

	
func _attack_cd() -> void:
	can_attack = true

func _hit_something(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		take_damage()

func take_damage() -> void:
	if health > 1:
		health -= 1
		print(health)
	else: 
		get_tree().call_deferred("reload_current_scene")
	
	
