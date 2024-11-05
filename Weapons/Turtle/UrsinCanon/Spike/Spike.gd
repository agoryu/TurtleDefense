extends CharacterBody2D

@export var damage = 1

var _speed : int
var _direction : Vector2
var _active : bool

func initialize(spikePosition, spikeRotation, speed):
	global_position = spikePosition
	rotation = spikeRotation + PI / 2
	_direction = Vector2(sin(rotation), -cos(rotation))
	_speed = speed

func fire() -> void:
	_active = true

func _physics_process(delta):
	if _active:
		move_and_collide(_direction * _speed * delta)
