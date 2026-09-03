extends CharacterBody2D

var speed = 100
var player: Area2D
var mound : Area2D
var health: int = 2
var detect = false
var timer_amount : float = 5

var second_frame_trigger : bool = false
var third_frame_trigger : bool = false
var fourth_frame_trigger: bool = false
var fifth_frame_trigger : bool = false

@onready var enemy_survive : Timer = $Timer
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.stop()
	animated_sprite.frame = 0
	for node in get_tree().get_nodes_in_group("player_detect"):
		player = node
	for node in get_tree().get_nodes_in_group("mound"):
		mound = node
	enemy_survive.start(timer_amount)
	

func _process(_delta:float)->void:
	var time_remaining = enemy_survive.time_left
	if not second_frame_trigger and time_remaining <= 3:
		animated_sprite.frame = 1
		second_frame_trigger == true
	if not third_frame_trigger and time_remaining <= 2:
		animated_sprite.frame = 2
		third_frame_trigger == true
	if not fourth_frame_trigger and time_remaining <= 1:
		animated_sprite.frame = 3
		fourth_frame_trigger == true
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	
	if detect == true:
		look_at(player.global_position)
	if detect == false:
		look_at(mound.global_position)

	velocity = Vector2(1,0).rotated(rotation) * speed
	move_and_slide()


func _entered_area(area: Area2D) -> void:
	if area.is_in_group("mound") or area.is_in_group("player_detect") or area.is_in_group("enemy"):
		call_deferred("queue_free")

func _detect(area: Area2D) -> void:
	if area.is_in_group("player_detect"):
		detect = true
		
func _nodetect(area: Area2D) -> void:
	if area.is_in_group("player_detect"):
		detect = false

func _survival() -> void:
	call_deferred("queue_free")

	
