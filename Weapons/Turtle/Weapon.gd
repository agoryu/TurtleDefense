extends AnimatedSprite2D

class_name Weapon

@onready var shoot_timer: Timer = $ShootTimer

func add_weapon():
	visible = true
	shoot_timer.start()

func _on_shoot_timer_timeout() -> void:
	action()

func action():
	pass

func upgrade_primary_stat():
	pass
	
func upgrade_secondary_stat():
	pass
