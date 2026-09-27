extends StaticBody2D

var health : int = 1
var boba_produced : int = 0

const MAX_BOBA = 20
const BOBA_AMOUNT = 1

const HEALTH_CONSTRAINT = 1
const DAMAGE_AMOUNT = 1

@export var boba_scene : PackedScene

@onready var path = $Path2D
@onready var follow = $Path2D/PathFollow2D
@onready var label = $CanvasLayer/HBoxContainer/Sprite2D/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "boba left x" + str(MAX_BOBA-boba_produced)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if boba_produced >= MAX_BOBA:
		get_tree().call_deferred("change_scene_to_file", 
		"res://scenes/win_screen.tscn")


func _hit(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("enemy"):
		take_damage()



func take_damage() -> void:
	if health > HEALTH_CONSTRAINT:
		health -= DAMAGE_AMOUNT
		print(health)
	else: 
		get_tree().call_deferred("change_scene_to_file", 
	"res://scenes/death_screen.tscn")


func _production() -> void:
	if boba_produced <= MAX_BOBA - BOBA_AMOUNT:
		boba_produced += BOBA_AMOUNT
		var boba = boba_scene.instantiate()
		follow.progress = randf() * path.curve.get_baked_length()
		boba.global_position = follow.global_position
		get_tree().current_scene.add_child(boba)
		label.text = "boba left x" + str(MAX_BOBA-boba_produced)
