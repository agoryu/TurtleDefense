extends TextureRect

@onready var weapon_dictionary = {
	"turtle.menu.beam": $BeamWeapon,
	"turtle.menu.laser": $Laser,
	"turtle.menu.multishot": $MultiShot,
	"turtle.menu.piratcanon": $PiratCanons,
	"turtle.menu.ursincanon": $UrsinCanon,
	"turtle.menu.shield": $ShieldGenerator
}

func _on_weapon_display(weapon_label: String):
	print("focus")
	for weapon in weapon_dictionary.keys():
		if weapon == weapon_label:
			weapon_dictionary.get(weapon).visible = true
		else:
			weapon_dictionary.get(weapon).visible = false
