extends HBoxContainer

class_name  TurtleWeaponButton

signal boost_selected

@onready var weapon_button: Button = $Weapon
@onready var boost1_button: Button = $Boost1
@onready var boost2_button: Button = $Boost2

@export var is_focus: bool = false
		
var weapon: Weapon

func _process(delta: float) -> void:
	if is_instance_valid(weapon):
		weapon_button.disabled = weapon.cost_weapon == 0 or weapon.cost_weapon > Game.nb_shell
		boost1_button.disabled = weapon.cost_weapon != 0 or weapon.cost_boost1 == 0 or weapon.cost_boost1 > Game.nb_shell
		boost2_button.disabled = weapon.cost_weapon != 0 or weapon.cost_boost2 == 0 or weapon.cost_boost2 > Game.nb_shell
		$Boost1/Details.cost_label.text = "%d" % weapon.cost_boost1
		$Boost2/Details.cost_label.text = "%d" % weapon.cost_boost2

func add_weapon():
	print("add weapon")
	weapon.add_weapon()
	weapon.cost_weapon = 0
	
func boost1():
	Game.nb_shell -= weapon.cost_boost1
	
func boost2():
	Game.nb_shell -= weapon.cost_boost2

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

func focus_button() -> bool:
	if not is_instance_valid(weapon_button):
		return false
	if not weapon_button.disabled:
		weapon_button.grab_focus()
		return true
	elif not boost1_button.disabled:
		boost1_button.grab_focus()
		return true
	elif not boost2_button.disabled:
		boost2_button.grab_focus()
		return true
	return false
