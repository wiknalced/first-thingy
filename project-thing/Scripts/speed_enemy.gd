extends "res://Scripts/enemy.gd"


func _ready():
	for node in get_tree().get_nodes_in_group("player_detect"):
		player = node
	for node in get_tree().get_nodes_in_group("mound"):
		mound = node
	speed = 150
	timer_amount = 2.5
	enemy_survive.start(timer_amount)
func _process(_delta : float):
	detect = true
