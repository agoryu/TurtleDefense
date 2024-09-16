extends TurtleWeaponButton

func _ready() -> void:
	weapon = Game.turtle.beam_weapon
	$Weapon/Details.cost_label.text = "%d" % weapon.cost_weapon

func boost1():
	weapon.upgrade_primary_stat()
	
func boost2():
	weapon.upgrade_secondary_stat()
