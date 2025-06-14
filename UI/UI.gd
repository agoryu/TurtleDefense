extends CanvasLayer

@onready var pause_menu = $Pause
@onready var turtle_menu = $TurtleMenu
@onready var hero_menu = $HeroPowerMenu
@onready var game_over = $GameOver

func _input(event):
	if game_over.visible:
		return
	if (event.is_action_released("ui_pause") 
		and not turtle_menu.visible):
		pause_menu.visible = !pause_menu.visible
		get_tree().paused = !get_tree().paused
	elif (event.is_action_released("ui_turtle_menu") 
		and not pause_menu.visible):
		get_tree().paused = !get_tree().paused
		if turtle_menu.visible:
			turtle_menu.close()
		else:
			turtle_menu.open()
		if not turtle_menu.visible:
			hero_menu.update_power_progress()


func _on_game_over() -> void:
	get_tree().paused = true
	game_over.visible = true
