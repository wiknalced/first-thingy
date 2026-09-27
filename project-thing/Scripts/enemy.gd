extends CharacterBody2D

# Default enemy information variables
var speed = 100
var player: Area2D
var generator : Area2D
var health: int = 2
var timer_amount : float = 5
var detect = false

# Animation timer triggers
var second_frame_trigger : bool = false
var third_frame_trigger : bool = false
var fourth_frame_trigger: bool = false
var fifth_frame_trigger : bool = false

# Group names
var detected_player_group = "player_detect"
var generator_group = "generator"
var enemy_group = "enemy"

var deletion = "queue_free"

# Timer variables
@onready var three_quarter : float  = 0
@onready var half : float = 0
@onready var quarter : float = 0

@onready var enemy_survive : Timer = $Timer
@onready var timer_sprite : AnimatedSprite2D = $Sprite2D/AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets timer visual to default sprite.
	timer_sprite.stop()
	timer_sprite.frame = 0
	
	# Calculate fractional values of timer for later use.
	three_quarter = float(0.75 * timer_amount)
	half = float(0.5 * timer_amount)
	quarter = float(0.25 * timer_amount)
	
	# Find player and generator nodes from their groups
	for node in get_tree().get_nodes_in_group(detected_player_group):
		player = node
	for node in get_tree().get_nodes_in_group(generator_group):
		generator = node
	
	enemy_survive.start(timer_amount)


func _process(_delta:float)->void:
	# Change timer sprite depending on time left
	var time_remaining = enemy_survive.time_left
	if not second_frame_trigger and time_remaining <= three_quarter:
		timer_sprite.frame = 1
		second_frame_trigger == true
	if not third_frame_trigger and time_remaining <= half:
		timer_sprite.frame = 2
		third_frame_trigger == true
	if not fourth_frame_trigger and time_remaining <= quarter:
		timer_sprite.frame = 3
		fourth_frame_trigger == true


func _physics_process(_delta: float) -> void:
	# Depending on signal, position enemy facing direction
	if detect == true:
		look_at(player.global_position)
	if detect == false:
		look_at(generator.global_position)
	
	# Calculate enemy movement
	velocity = Vector2(1,0).rotated(rotation) * speed
	move_and_slide()


func _entered_area(area: Area2D) -> void:
	# Check if area is in group
	if (
		area.is_in_group(generator_group) or 
		area.is_in_group(detected_player_group) or 
		area.is_in_group(enemy_group)
):
		call_deferred(deletion)
	# Validity check if area has no assigned value or isn't in group
	else:
		return


# Check if player is in enemy detection range
func _detect(area: Area2D) -> void:
	if area.is_in_group(detected_player_group):
		detect = true

# Check if player isn't in enemy detection range
func _nodetect(area: Area2D) -> void:
	if area.is_in_group(detected_player_group):
		detect = false
