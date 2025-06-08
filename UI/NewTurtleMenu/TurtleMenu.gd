extends Control

@onready var weapon_panel = $WeaponButtons
@onready var weapon_buttons = weapon_panel.get_children()
@onready var weapon_cost : Label = $WeaponCost

func _ready() -> void:
	#Game.turtle = preload("res://Characters/Turtle/Turtle.tscn").instantiate()
	open()
	init_weapon()
	
func open() -> void:
	visible = true
	anim_weapon_button()
	weapon_buttons[0].get_child(0).get_child(0).grab_focus()
	
func init_weapon():
	if is_instance_valid(Game.turtle):
		weapon_panel.get_node("LaserBeam").weapon = Game.turtle.beam_weapon
		weapon_panel.get_node("Laser").weapon = Game.turtle.laser_weapon
		weapon_panel.get_node("MultiShot").weapon = Game.turtle.multishot_weapon
		weapon_panel.get_node("PiratCanon").weapon = Game.turtle.pirat_canon_weapon
		weapon_panel.get_node("UrsinCanon").weapon = Game.turtle.ursin_canon_weapon
		weapon_panel.get_node("Shield").weapon = Game.turtle.armor_weapon

func anim_weapon_button():
	for i in range(weapon_buttons.size()):
		var tween = create_tween()
		tween.tween_property(weapon_buttons[i], "position:x", 0, 0.3).set_delay(i * 0.2)

func _on_power_selected(cost_value: int) -> void:
	weapon_cost.text = Game.nb_shell + " / " + cost_value
