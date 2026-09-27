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
const DETECTED_PLAYER_GROUP = "player_detect"
const GENERATOR_GROUP = "generator"
const ENEMY_GROUP = "enemy"

const DELETION = "queue_free"


const THREE_QUARTER_FRACTION := 0.75
const HALF_FRACTION := 0.5
const QUARTER_FRACTION := 0.25

const ORIGINAL_TIME_FRAME = 0
const THREE_QUARTER_TIME_FRAME = 1
const HALF_TIME_FRAME = 2
const QUARTER_TIME_FRAME = 3
const SLIVER_TIEM_FRAME = 4

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
	timer_sprite.frame = ORIGINAL_TIME_FRAME
	
	# Calculate fractional values of timer for later use.
	three_quarter = float(THREE_QUARTER_FRACTION * timer_amount)
	half = float(HALF_FRACTION * timer_amount)
	quarter = float(QUARTER_FRACTION * timer_amount)
	
	# Find player and generator nodes from their groups
	for node in get_tree().get_nodes_in_group(DETECTED_PLAYER_GROUP):
		player = node
	for node in get_tree().get_nodes_in_group(GENERATOR_GROUP):
		generator = node
	
	# Start enemy survival timer
	enemy_survive.start(timer_amount)


func _process(_delta:float)->void:
	# Change timer sprite depending on time left
	var time_remaining = enemy_survive.time_left
	if not second_frame_trigger and time_remaining <= three_quarter:
		timer_sprite.frame = THREE_QUARTER_TIME_FRAME
		second_frame_trigger == true
	if not third_frame_trigger and time_remaining <= half:
		timer_sprite.frame = HALF_FRACTION
		third_frame_trigger == true
	if not fourth_frame_trigger and time_remaining <= quarter:
		timer_sprite.frame = QUARTER_TIME_FRAME
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
		area.is_in_group(GENERATOR_GROUP) or 
		area.is_in_group(DETECTED_PLAYER_GROUP) or 
		area.is_in_group(ENEMY_GROUP)
):
		call_deferred(DELETION)
	# Validity check if area has no assigned value or isn't in group
	else:
		return


# Check if player is in enemy detection range
func _detect(area: Area2D) -> void:
	if area.is_in_group(DETECTED_PLAYER_GROUP):
		detect = true

# Check if player isn't in enemy detection range
func _nodetect(area: Area2D) -> void:
	if area.is_in_group(DETECTED_PLAYER_GROUP):
		detect = false


# Delete enemies once base timer runs out
func _survival():
	call_deferred(DELETION)
