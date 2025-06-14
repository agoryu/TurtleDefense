extends PanelContainer

@onready var power_progress = $HBoxContainer/PowerProgress
@onready var level_label : Label = $HBoxContainer/Level

func _process(delta: float) -> void:
	var lvl = Game.player.level
	level_label.text = "Level " + str(lvl)
	var color : Color
	if lvl < 6:
		color = Color(1, 1, 1) # Blanc (commun)
	elif lvl < 12:
		color = Color(0.12, 0.56, 1) # Bleu (magique)
	elif lvl < 18:
		color = Color(0.62, 0.2, 0.94) # Violet (rare)
	elif lvl < 24:
		color = Color(1, 0.8, 0) # Jaune (légendaire)
	elif lvl < 30:
		color = Color(1, 0.5, 0) # Orange (set/ancien)
	else:
		color = Color(0.8, 0.2, 0.2) # Rouge (primal)
	level_label.set("theme_override_colors/font_color", color)

func update_power_progress():
	power_progress.move_pos_power()
