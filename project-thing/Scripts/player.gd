extends CharacterBody2D

var enemy = Area2D
var speed: float = 300
var health: int = 5
var can_attack : bool = true

@export var pivot : Node2D
@export var attack_spawn : Marker2D
@export var weapons_scene : PackedScene
@export var attack_timer : Timer

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("enemy"):
		enemy = node
func _process(_delta) -> void:
	if Input.is_action_just_pressed("ui_accept") and can_attack:
		_attack()

func _physics_process(_delta: float) -> void:
	var direction : Vector2 = Vector2(0.0, 0.0)
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	velocity = speed * direction.normalized()
	move_and_slide()
	
func take_damage() -> void:
	if health > 1:
		health -= 1
		print(health)
	else: 
		get_tree().call_deferred("reload_current_scene")

func _attack() -> void:
	var weapon = weapons_scene.instantiate()
	weapon.rotation = pivot.global_rotation
	weapon.global_position = attack_spawn.global_position
	add_sibling(weapon)
	can_attack = false
	attack_timer.start()
	
func _attack_cd() -> void:
	can_attack = true

func _hit_something(area: Area2D) -> void:
	take_damage()
	
