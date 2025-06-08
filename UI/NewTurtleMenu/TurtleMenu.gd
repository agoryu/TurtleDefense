extends Control

@onready var weapon_panel = $WeaponButtons
@onready var weapon_buttons = weapon_panel.get_children()
@onready var weapon_cost : Label = $ShellInformation/WeaponCost
@onready var open_audio_player : AudioStreamPlayer2D = $OpenAudioPlayer

var initial_position_x : int

func _ready() -> void:
	init_weapon()
	initial_position_x = weapon_buttons[0].position.x
	
func open() -> void:
	open_audio_player.play()
	visible = true
	play_elastic_open()
	weapon_buttons[0].get_child(0).get_child(0).grab_focus()
	anim_weapon_button()
	
func close() -> void:
	visible = false
	for weapon in weapon_buttons:
		weapon.position.x = initial_position_x
	
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
		tween.tween_property(weapon_buttons[i], "position:x", 0, 0.3).set_delay((i+1) * 0.2)

func _on_power_selected(cost_value: int) -> void:
	weapon_cost.text = str(Game.nb_shell) + " / " + str(cost_value)

func play_elastic_open():
	self.scale = Vector2(0.7, 0.7)
	self.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.15)
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.18).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(0.95, 0.95), 0.10).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.10).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
