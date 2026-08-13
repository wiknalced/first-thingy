extends "res://Scripts/enemy.gd"


func _ready():
	for node in get_tree().get_nodes_in_group("player_detect"):
		player = node
	for node in get_tree().get_nodes_in_group("mound"):
		mound = node
	speed = 50
	timer_amount = 5

	
