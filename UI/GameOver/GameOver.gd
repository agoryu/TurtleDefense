extends VBoxContainer

func _on_button_button_up() -> void:
	get_tree().paused = false
	Game.reset_scene()
	visible = false

func _on_visibility_changed() -> void:
	if visible:
		$Retry.grab_focus()

func _on_exit_button_up() -> void:
	get_tree().quit()
