extends Camera2D

@onready var timer: Timer = $Timer

@export var shake_amount : float = 5.0
@export var character : CharacterBody2D

func _ready():
	reparent(character)

func _process(delta) -> void:
	global_position = character.global_position
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
