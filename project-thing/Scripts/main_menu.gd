extends Control

@onready var confirmation = $ConfirmationDialog
@onready var tutorial_confirm = $TutorialBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _play() -> void:
	tutorial_confirm.popup()


func _quit() -> void:
	confirmation.popup()


func _confirm() -> void:
	get_tree().quit()

func _unconfirm() -> void:
	confirmation.hide()


func _tutorial_confirm() -> void:
	get_tree().call_deferred("change_scene_to_file",
	"res://scenes/tutorial.tscn")


func _tutorial_decline() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn")

func _tutorial_close() -> void:
	tutorial_confirm.hide()
