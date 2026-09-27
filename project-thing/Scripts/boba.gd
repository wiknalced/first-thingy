extends Area2D

# Boba variables
const ENEMY_GROUP = "enemy"
const PLAYER_DETECT_GROUP = "player_detect"

# Boba gets deleted if touched by player or enemy.
func _hit(area: Area2D) -> void:
	# Check if boba has touched an area to output signal.
	if area.is_in_group(PLAYER_DETECT_GROUP) or area.is_in_group(ENEMY_GROUP):
		queue_free()

	# Validity check if area has no value assigned to it or isn't in group.
	else:
		return
