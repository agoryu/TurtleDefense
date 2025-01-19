extends Node2D

@onready var beam : Weapon = $BeamWeapon
@onready var ursinCanon : Weapon = $UrsinCanon
@onready var laser : Weapon = $Laser
@onready var shield : Node2D = $Shield
@onready var multishot : Weapon = $MultiShot
@onready var piratCanon : Weapon = $PiratCanon

func _input(event):
	if event.is_action_pressed("add_turtle_weapon_1"):
		beam.add_weapon()
	if event.is_action_pressed("add_turtle_weapon_2"):
		ursinCanon.add_weapon()
	if event.is_action_pressed("add_turtle_weapon_3"):
		shield.add_weapon()
	if event.is_action_pressed("add_turtle_weapon_4"):
		multishot.add_weapon()
	if event.is_action_pressed("add_turtle_weapon_5"):
		piratCanon.add_weapon()
	if event.is_action_pressed("add_turtle_weapon_6"):
		laser.add_weapon()
