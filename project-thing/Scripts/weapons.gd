extends Area2D

var enemy = CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_tree().get_nodes_in_group("enemy"):
		enemy = node
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		pass
		
func _damage_enemy(body:CharacterBody2D) -> void:
	if body == enemy:
		enemy.take_damage()
