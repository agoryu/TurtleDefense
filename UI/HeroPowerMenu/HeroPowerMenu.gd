extends PanelContainer

@onready var power_progress = $HBoxContainer/PowerProgress

func update_power_progress():
	power_progress.move_pos_power()
