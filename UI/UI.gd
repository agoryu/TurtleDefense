extends CanvasLayer

@onready var pause_menu = $Pause

func _input(event):
	if event.is_action_released("ui_pause"):
		pause_menu.visible = !pause_menu.visible
		get_tree().paused = !get_tree().paused
