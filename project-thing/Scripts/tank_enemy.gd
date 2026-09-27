extends "res://Scripts/enemy.gd"


# Change enemy stats and use new stats for updated enemy script
func _ready():
	speed = 50
	timer_amount = 10
	super()
