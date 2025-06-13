extends MainButton


func _on_button_up() -> void:
	get_tree().quit()

func _on_focus_entered() -> void:
	focus_animation()
