extends TurtleWeaponButton

func _ready() -> void:
	weapon = Game.turtle.ursin_canon_weapon
	$Weapon/Details.cost_label.text = "%d" % weapon.cost_weapon
