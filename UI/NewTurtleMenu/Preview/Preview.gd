extends Panel

@onready var weapon_dictionary = {
	"turtle.menu.beam": $Preview/BeamWeapon,
	"turtle.menu.laser": $Preview/Laser,
	"turtle.menu.multishot": $Preview/MultiShot,
	"turtle.menu.piratcanon": $Preview/PiratCanons,
	"turtle.menu.ursincanon": $Preview/UrsinCanon,
	"turtle.menu.shield": $Preview/ShieldGenerator
}

func _on_weapon_display(weapon_label: String):
	for weapon in weapon_dictionary.keys():
		if weapon == weapon_label:
			weapon_dictionary.get(weapon).visible = true
		else:
			weapon_dictionary.get(weapon).visible = false
