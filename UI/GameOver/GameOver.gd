extends VBoxContainer

func _on_visibility_changed() -> void:
	if visible:
		$Retry.grab_focus()

func _on_retry_reset() -> void:
	visible = false

func _on_options_menu_close_options() -> void:
	$Retry.grab_focus()
