extends CharacterBody2D

var _speed
var _direction
var _group

func initialize(origin, speed):
	global_position = origin.global_position
	_direction = origin.direction
	_group = origin.group
	_speed = speed

func _physics_process(delta):
	position += _direction * _speed * delta
