extends TurtleWeaponButton

func _ready() -> void:
	weapon = Game.turtle.armor_weapon
	$Weapon/Details.cost_label.text = "%d" % weapon.cost_weapon
