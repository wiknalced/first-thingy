extends Area2D

# Boba variables
var enemy_group = "enemy"
var player_detect_group = "player_detect"

# Boba gets deleted if touched by player or enemy.
func _hit(area: Area2D) -> void:
	# Check if boba has touched an area to output signal.
	if area.is_in_group(player_detect_group) or area.is_in_group(enemy_group):
		queue_free()
	
	# Validity check if area has no value assigned to it or isn't in group.
	else:
		return
