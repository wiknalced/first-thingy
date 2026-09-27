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

const ENEMY_GROUP = "enemy"
const COLLECTIBLES_GROUP = "collective"

const DEATH_PAGE = "res://scenes/death_screen.tscn"


# Automatically gathers all health/boba UI elements into a list.
# This is so the game can show/hide them when health changes.
func _ready() -> void:
	var boba_parent = $Health/HBoxContainer
	for child in boba_parent.get_children():
		health_list.append(child)


# Updates boba health visibility based on player's current health.
func update_boba():
	for i in range(health_list.size()):
		health_list[i].visible = i < health


# Applies damage to the player. If health remains, update the boba icons
# Otherwise switch to the death scene.
func take_damage() -> void:
	if health > MIN_HEALTH: 
		health -= DAMAGE
		update_boba()
	else: 
		get_tree().call_deferred("change_scene_to_file", DEATH_PAGE)


# Handles player movement by processing each physics frame
func _physics_process(_delta: float) -> void:
	var direction : Vector2 = Vector2(0.0, 0.0)
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	velocity = speed * direction.normalized()
	move_and_slide()


# What to do when player hits area.
func _hit_something(area: Area2D) -> void:
	# Checks if area has hit an enemy and to take damage if it has
	if area.is_in_group(ENEMY_GROUP):
		take_damage()

	# Checks if area has hit a collectible item and to heal if it has
	if area.is_in_group(COLLECTIBLES_GROUP):
		if health <= MAX_HEALTH:
			health += HEAL
			update_boba()

	# Validity check for if area isn't in any of the top groups
	else:
		return
