extends CharacterBody2D

@export var damage = 1

@onready var _timer : Timer = $Timer
var _speed
var _direction
var _group

func initialize(origin, speed):
	global_position = origin.global_position
	_direction = origin.direction
	_group = origin.group
	_speed = speed

func _ready():
	_timer.start()

func _physics_process(delta):
	move_and_collide(_direction * _speed * delta)

func _on_timer_timeout() -> void:
	queue_free()
