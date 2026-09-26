extends CharacterBody2D

#https://www.youtube.com/watch?v=kvWF_v1OErI
var health_list : Array[TextureRect]

var enemy = Area2D # this was enemy = Node2D but signals stopped working unless
# it was enemy = Area2D, there's probably a better way to code this.
var speed: float = 300
var health : int = 5
var can_attack : bool = true

const MAX_HEALTH = 5
const MIN_HEALTH = 1
const DAMAGE = 1
const HEAL = 1


func _ready() -> void:
	var boba_parent = $Health/HBoxContainer
	for child in boba_parent.get_children():
		health_list.append(child)
func _process(_delta) -> void:
	pass

func update_boba():
	for i in range(health_list.size()):
		health_list[i].visible = i < health

func take_damage() -> void:
	if health > MIN_HEALTH: #ALERT Magic numbers
		health -= DAMAGE
		update_boba()
	else: 
		get_tree().call_deferred("reload_current_scene")

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
		
	if area.is_in_group("collectible"):
		if health <= MAX_HEALTH: #ALERT MAGIC NUMBERS
			health += HEAL
			update_boba()
