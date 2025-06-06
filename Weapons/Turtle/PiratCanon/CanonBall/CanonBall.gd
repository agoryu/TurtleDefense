extends CharacterBody2D

@export var damage = 1

@onready var _timer : Timer = $Timer
var _speed
var _direction

func initialize(origin, speed):
	global_position = origin.global_position
	_direction = origin.direction
	_speed = speed

func _ready():
	_timer.start()
	$AudioStreamPlayer2D.play()

func _physics_process(delta):
	move_and_collide(_direction * _speed * delta)

func _on_timer_timeout() -> void:
	queue_free()
