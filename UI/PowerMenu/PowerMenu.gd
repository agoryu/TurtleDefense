extends Control

func _ready():
	visible = false

func open():
	visible = true
	Game.can_open_menu = false
	get_tree().paused = true

func _on_button_button_up():
	visible = false
	get_tree().paused = false
	Game.can_open_menu = true
