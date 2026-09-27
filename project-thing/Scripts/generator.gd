extends StaticBody2D


var boba_produced : int = 0

const MAX_BOBA = 20
const BOBA_AMOUNT = 1

const HEALTH_CONSTRAINT = 1
const DAMAGE_AMOUNT = 1

const ENEMY_GROUP = "enemy"

const DEATH_SCREEN = "res://scenes/death_screen.tscn"
const WIN_SCREEN = "res://scenes/win_screen.tscn"

@export var boba_scene : PackedScene

@onready var path = $Path2D
@onready var follow = $Path2D/PathFollow2D
@onready var label = $CanvasLayer/HBoxContainer/Sprite2D/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "boba left x" + str(get_boba_left())


# Check if boba produced has reached winning amount.
# Once winning amount is reached, swap screen to win screen
func _process(_delta: float) -> void:
	if boba_produced >= MAX_BOBA:
		get_tree().call_deferred("change_scene_to_file", WIN_SCREEN)


# Take damage if hit by area in enemy group
func _hit(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group(ENEMY_GROUP):
		take_damage()


# Function to swap to death screen
func take_damage() -> void:
	get_tree().call_deferred("change_scene_to_file", DEATH_SCREEN)


# Produce one boba if total boba produced is under 20
# Update label
func _production() -> void:
	if boba_produced <= MAX_BOBA - BOBA_AMOUNT:
		boba_produced += BOBA_AMOUNT
		var boba = boba_scene.instantiate()
		follow.progress = randf() * path.curve.get_baked_length()
		boba.global_position = follow.global_position
		get_tree().current_scene.add_child(boba)
		label.text = "boba left x" + str(MAX_BOBA-boba_produced)


# Function to show boba left
func get_boba_left() -> int:
	return MAX_BOBA - boba_produced
