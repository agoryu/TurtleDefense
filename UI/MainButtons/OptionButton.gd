extends MainButton

@export var options_menu : Control

func _on_button_up() -> void:
	options_menu.visible = true

func _on_focus_entered() -> void:
	focus_animation()
