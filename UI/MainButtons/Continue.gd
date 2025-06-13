extends MainButton

@export var control : Control

func _on_button_up() -> void:
	control.visible = false
	get_tree().paused = false

func _on_focus_entered() -> void:
	focus_animation()
