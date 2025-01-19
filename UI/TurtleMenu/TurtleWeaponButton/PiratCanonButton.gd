extends TurtleWeaponButton

func _ready() -> void:
	weapon = Game.turtle.pirat_canon_weapon
	$Weapon/Details.cost_label.text = "%d" % weapon.cost_weapon
