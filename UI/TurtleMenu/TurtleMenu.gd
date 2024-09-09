extends Panel

@onready var weapons: HBoxContainer = $VBoxContainer/Weapons

func _on_visibility_changed() -> void:
	if visible:
		weapons.get_child(0).is_focus = true
