extends TurtleWeaponButton

func _ready() -> void:
	weapon = Game.turtle.multishot_weapon
	$Weapon/Details.cost_label.text = "%d" % weapon.cost_weapon
