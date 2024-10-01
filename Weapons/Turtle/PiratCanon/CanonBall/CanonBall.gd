extends CharacterBody2D

var _speed
var _direction

func _init():
	print(global_position)

func set_speed(speed):
	_speed = speed

func set_direction(direction):
	_direction = direction

func _physics_process(delta):
	move_and_collide(_direction * _speed * delta)
