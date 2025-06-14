extends VBoxContainer

func _on_visibility_changed() -> void:
	if visible:
		$Continue.grab_focus()

func _on_retry_reset() -> void:
	visible = false

func _on_options_menu_close_options() -> void:
	$Continue.grab_focus()
