extends Camera2D

@onready var timer: Timer = $Timer

@export var shake_amount : float = 5.0

func _ready():
	limit_left = 0
	limit_right = Game.screen_size.x
	limit_top = 0
	limit_bottom = Game.screen_size.y
	
func _process(delta: float) -> void:
		if not timer.is_stopped():
			offset = Vector2(
				randf_range(-1.0, 1.0) * shake_amount,
				randf_range(-1.0, 1.0) * shake_amount
			)
		else:
			offset = Vector2.ZERO

func take_damage():
	timer.start()
	Input.start_joy_vibration(0, 0.5, 0.5)

func _on_timer_timeout() -> void:
	Input.stop_joy_vibration(0)
