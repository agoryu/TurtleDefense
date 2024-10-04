extends Node2D

@onready var beam : Weapon = $BeamWeapon
@onready var ursinCanon : Node2D = $UrsinCanon
@onready var armor : AnimatedSprite2D = $Armor
@onready var multishot : AnimatedSprite2D = $MultiShot
@onready var piratCanon : Node2D = $PiratCanon
@onready var laser : Node2D = $Laser

func _input(event):
	if event.is_action_pressed("add_turtle_weapon_1"):
		beam.add_weapon()
	if event.is_action_pressed("add_turtle_weapon_2"):
		ursinCanon.Upgrade()
	if event.is_action_pressed("add_turtle_weapon_3"):
		armor.Upgrade()
	if event.is_action_pressed("add_turtle_weapon_4"):
		multishot.add_weapon()
	if event.is_action_pressed("add_turtle_weapon_5"):
		piratCanon.add_weapon()
	if event.is_action_pressed("add_turtle_weapon_6"):
		laser.Upgrade()
