extends CharacterBody2D

var speed: float = 150.0
var player: Area2D
var mound : Area2D
var health: int = 3
var can_damage = true
var detect = false

@export var cooldown : Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_tree().get_nodes_in_group("player_detect"):
		player = node
	for node in get_tree().get_nodes_in_group("mound"):
		mound = node
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if detect == true:
		look_at(player.global_position)
		velocity = Vector2(1,0).rotated(rotation) * speed
		move_and_slide()
	if detect == false:
		look_at(mound.global_position)
		velocity = Vector2(1,0).rotated(rotation) * speed
		move_and_slide()


func _entered_area(area: Area2D) -> void:
	if area.is_in_group("mound"):
		call_deferred("queue_free")
	if area.is_in_group("player_detect"):
		take_damage()

func _detect(area: Area2D) -> void:
	if area.is_in_group("player_detect"):
		detect = true
		

func _nodetect(area: Area2D) -> void:
	if area.is_in_group("player_detect"):
		detect = false

func take_damage() -> void:
	if health > 1:
		health -= 1
		print(health)
	else: 
		call_deferred("queue_free")
