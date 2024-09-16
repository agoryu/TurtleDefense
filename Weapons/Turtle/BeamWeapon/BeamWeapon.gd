extends Weapon

@onready var _laser_beam = $LaserBeam2D
@onready var _end_shoot_timer = $EndShootTimer
@onready var _shoot_timer = $ShootTimer

func _ready() -> void:
	_laser_beam.damage = damage

func action():
	_laser_beam.set_is_casting(true)
	_end_shoot_timer.start()

func upgrade_primary_stat():
	super()
	damage += 1
	_laser_beam.damage = damage
	
func upgrade_secondary_stat():
	super()
	_laser_beam.increase_width(10)

func _on_end_shoot_timer_timeout() -> void:
	_laser_beam.set_is_casting(false)
	_shoot_timer.start()
