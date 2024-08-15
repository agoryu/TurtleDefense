extends CanvasLayer

@onready var power_menu: Control = $PowerMenu
@onready var label: Label = $Label

func _unhandled_key_input(event):
	if event is InputEventKey:
		if (event.pressed 
			and event.keycode == KEY_ENTER
			and label.visible
		):
			label.visible = false
			power_menu.open()
