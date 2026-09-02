extends "res://Scripts/enemy.gd"


func _ready():
	speed = 150
	timer_amount = 2.5
	super()
func _process(delta : float):
	detect = true
