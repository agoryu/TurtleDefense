extends CanvasLayer

@onready var pause_menu = $Pause
@onready var turtle_menu = $TurtleMenu
@onready var hero_menu = $HeroPowerMenu

func _input(event):
	if event.is_action_released("ui_pause") and not turtle_menu.visible:
		pause_menu.visible = !pause_menu.visible
		get_tree().paused = !get_tree().paused
	elif event.is_action_released("ui_turtle_menu") and not pause_menu.visible:
		turtle_menu.visible = !turtle_menu.visible
		get_tree().paused = !get_tree().paused
		if not turtle_menu.visible:
			hero_menu.update_power_progress()
	$Overlay.visible = get_tree().paused
