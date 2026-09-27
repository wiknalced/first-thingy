extends CharacterBody2D

#https://www.youtube.com/watch?v=kvWF_v1OErI for health bar
var health_list : Array[TextureRect]
var enemy = Area2D

# Player info
var speed: float = 300
var health : int = 5

# Helpful values
const MAX_HEALTH = 5
const MIN_HEALTH = 0
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
	if health > MIN_HEALTH: 
		health -= DAMAGE
		update_boba()
	else: 
		get_tree().call_deferred("change_scene_to_file", 
	"res://scenes/death_screen.tscn")

func _physics_process(_delta: float) -> void:
	var direction : Vector2 = Vector2(0.0, 0.0)
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	velocity = speed * direction.normalized()
	move_and_slide()


func _hit_something(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		take_damage()


	if area.is_in_group("collectible"):
		if health <= MAX_HEALTH: #ALERT MAGIC NUMBERS
			health += HEAL
			update_boba()
