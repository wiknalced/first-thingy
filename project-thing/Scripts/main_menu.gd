extends Control

const TUTORIAL_PAGE = "res://scenes/tutorial.tscn"
const GAME_PAGE =  "res://scenes/main.tscn"

@onready var confirmation = $ConfirmationDialog
@onready var tutorial_confirm = $TutorialBox


# Ask if tutorial is wanted when play button pressed
func _play() -> void:
	tutorial_confirm.popup()

# Confirm quit when quit button pressed
func _quit() -> void:
	confirmation.popup()


# Fully quit when confirmed quit button pressed
func _confirm() -> void:
	get_tree().quit()


# Hide confirm window 
func _unconfirm() -> void:
	confirmation.hide()


func _tutorial_confirm() -> void:
	get_tree().call_deferred("change_scene_to_file", TUTORIAL_PAGE)


func _tutorial_decline() -> void:
	get_tree().call_deferred("change_scene_to_file", GAME_PAGE)


func _tutorial_close() -> void:
	tutorial_confirm.hide()
