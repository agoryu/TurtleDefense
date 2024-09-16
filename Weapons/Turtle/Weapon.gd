extends AnimatedSprite2D

class_name Weapon

@onready var shoot_timer: Timer = $ShootTimer

@export var cost_weapon : int = 2
@export var cost_boost1 : int = 2
@export var cost_boost2 : int = 2

func add_weapon():
	visible = true
	shoot_timer.start()
	Game.reduce_shell(cost_weapon)

func _on_shoot_timer_timeout() -> void:
	action()

func action():
	pass

func upgrade_primary_stat():
	pass
	
func upgrade_secondary_stat():
	pass
