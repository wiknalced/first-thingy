extends "res://Scripts/enemy.gd"


# Change enemy stats and use new stats for updated enemy script
func _ready():
	speed = 150
	timer_amount = 2.5
	detect = true
	super()
