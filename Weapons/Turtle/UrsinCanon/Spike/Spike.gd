extends CharacterBody2D

@export var damage = 1

var _speed : int
var _direction : Vector2
var _active : bool

func initialize(spikePosition, spikeRotation, speed, damage_value):
	global_position = spikePosition
	rotation = spikeRotation + PI / 2
	_direction = Vector2(sin(rotation), -cos(rotation))
	_speed = speed
	damage = damage_value

func fire() -> void:
	_active = true

func _physics_process(delta):
	if _active:
		move_and_collide(_direction * _speed * delta)
