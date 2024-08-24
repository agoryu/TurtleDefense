extends Control

func _ready():
	visible = false

func open():
	visible = true
	get_tree().paused = true

func _on_button_button_up():
	visible = false
	get_tree().paused = false
