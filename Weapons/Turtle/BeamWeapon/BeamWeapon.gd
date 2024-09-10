extends Weapon

@onready var _laser_beam = $LaserBeam2D
@onready var _end_shoot_timer = $EndShootTimer
@onready var _shoot_timer = $ShootTimer

func _ready() -> void:
	add_weapon()

func action():
	_laser_beam.action()
	_end_shoot_timer.start()

func upgrade_primary_stat():
	pass
	
func upgrade_secondary_stat():
	pass

func _on_end_shoot_timer_timeout() -> void:
	_laser_beam.end_action()
	_shoot_timer.start()
