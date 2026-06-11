extends CharacterBody2D

var enemy = CharacterBody2D
var speed: float = 300
var health: int = 5

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("enemy"):
		enemy = node
func _process(_delta) -> void:
	pass

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
		
func _damage_enemy(body: Node2D) -> void:
	if body == enemy:
		enemy.take_damage()
