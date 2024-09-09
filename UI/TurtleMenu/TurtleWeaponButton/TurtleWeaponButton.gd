extends HBoxContainer

class_name  TurtleWeaponButton

signal boost_selected

@onready var weapon_button: Button = $Weapon
@onready var boost1_button: Button = $Boost1
@onready var boost2_button: Button = $Boost2

@export var is_focus: bool = false:
	set(value):
		is_focus = value
		if value: focus_button()

func _ready() -> void:
	if is_focus:
		focus_button()

func add_weapon():
	pass
	
func boost1():
	pass
	
func boost2():
	pass

func _on_weapon_button_up() -> void:
	weapon_button.disabled = true
	weapon_button.focus_mode = Control.FOCUS_NONE
	boost1_button.disabled = false
	boost1_button.focus_mode = Control.FOCUS_ALL
	boost2_button.disabled = false
	boost2_button.focus_mode = Control.FOCUS_ALL
	add_weapon()
	emit_signal("boost_selected")

func _on_boost_1_button_up() -> void:
	boost1()
	emit_signal("boost_selected")

func _on_boost_2_button_up() -> void:
	boost2()
	emit_signal("boost_selected")

func focus_button():
	if !weapon_button.disabled:
		weapon_button.grab_focus()
	else:
		boost1_button.grab_focus()
