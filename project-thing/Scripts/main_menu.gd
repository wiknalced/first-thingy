extends Control

@onready var confirmation = $ConfirmationDialog

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn")


func _quit() -> void:
	confirmation.popup_centered()


func _confirm() -> void:
	get_tree().quit()

func _unconfirm() -> void:
	confirmation.hide()
