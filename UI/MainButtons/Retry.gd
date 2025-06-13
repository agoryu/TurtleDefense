extends MainButton

signal reset

func _on_button_up() -> void:
	Game.reset_scene()
	emit_signal("reset")
	
func _on_focus_entered() -> void:
	focus_animation()
