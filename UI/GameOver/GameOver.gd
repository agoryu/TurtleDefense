extends VBoxContainer

func _on_button_button_up() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_visibility_changed() -> void:
	if visible:
		$Button.grab_focus()
