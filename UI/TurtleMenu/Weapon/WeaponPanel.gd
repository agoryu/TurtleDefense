extends PanelContainer

signal power_selected
signal weapon_selected

@export var weapon_label : String = ""
@export var bonus1_label : String = ""
@export var bonus2_label : String = ""

@onready var weapon_button : Button = $HBoxContainer/Weapon
@onready var bonus1_button : Button = $HBoxContainer/Bonus1
@onready var bonus2_button : Button = $HBoxContainer/Bonus2
@onready var audio_player_validation : AudioStreamPlayer2D = $ButtonAudioPlayerValidation
@onready var audio_player_focus : AudioStreamPlayer2D = $ButtonAudioPlayerFocus

var weapon : Weapon

func _ready() -> void:
	weapon_button.text = weapon_label
	bonus1_button.text = bonus1_label
	bonus2_button.text = bonus2_label
	
func _process(delta: float) -> void:
	if is_instance_valid(weapon):
		weapon_button.disabled = weapon.cost_weapon == 0 or weapon.cost_weapon > Game.nb_shell
		bonus1_button.disabled = weapon.cost_weapon != 0 or weapon.cost_boost1 == 0 or weapon.cost_boost1 > Game.nb_shell
		bonus2_button.disabled = weapon.cost_weapon != 0 or weapon.cost_boost2 == 0 or weapon.cost_boost2 > Game.nb_shell

func add_weapon():
	if is_instance_valid(weapon):
		weapon.add_weapon()
		weapon.cost_weapon = 0
		audio_player_validation.play()
		emit_signal("power_selected", weapon.cost_weapon)
		weapon_button.grab_focus()

func boost1():
	if is_instance_valid(weapon):
		Game.nb_shell -= weapon.cost_boost1
		weapon.upgrade_primary_stat()
		audio_player_validation.play()
		emit_signal("power_selected", weapon.cost_boost1)
		bonus1_button.grab_focus()

func boost2():
	if is_instance_valid(weapon):
		Game.nb_shell -= weapon.cost_boost2
		weapon.upgrade_secondary_stat()
		audio_player_validation.play()
		emit_signal("power_selected", weapon.cost_boost2)
		bonus2_button.grab_focus()

func _on_weapon_focus_entered() -> void:
	if is_instance_valid(weapon):
		emit_signal("power_selected", weapon.cost_weapon)
	emit_signal("weapon_selected", weapon_label)
	audio_player_focus.play()

func _on_bonus_1_focus_entered() -> void:
	if is_instance_valid(weapon):
		emit_signal("power_selected", weapon.cost_boost1)
	emit_signal("weapon_selected", weapon_label)
	audio_player_focus.play()

func _on_bonus_2_focus_entered() -> void:
	if is_instance_valid(weapon):
		emit_signal("power_selected", weapon.cost_boost2)
	emit_signal("weapon_selected", weapon_label)
	audio_player_focus.play()
