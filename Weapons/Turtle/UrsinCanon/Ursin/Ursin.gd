extends Node2D

var _speed
var _direction
var _spikes: Array = []
@export var spikeSpeed : int = 200
@export var sipkesCount : int = 10

@onready var _timer : Timer = $Timer
@onready var _spikesTimer : Timer = $SpikesTimer

func initialize(origin, speed, bullet):
	global_position = origin.global_position
	_direction = origin.direction
	_speed = speed
	instance_around_circle(global_position, 15, bullet, sipkesCount, 0)

func _ready():
	_timer.start()

func _physics_process(delta):
	position += _direction * _speed * delta
	_speed *= .985

func _on_timer_timeout() -> void:
	for spike in _spikes:
		if spike != null:
			spike.fire()
	_spikesTimer.start()

func instance_around_circle(circle_center : Vector2, circle_radius : float, object : PackedScene, count : int, base_rotation : float):
	var radial_offset = Vector2.RIGHT.rotated(base_rotation) * circle_radius
	var radial_increment = (2.0 * PI) / float(count)
	for step in count:
		var instance = object.instantiate()
		var spikePosition = global_position - circle_center + radial_offset
		instance.initialize(spikePosition, radial_offset.angle(), spikeSpeed)
		add_child(instance)
		_spikes.append(instance)
		radial_offset = radial_offset.rotated(radial_increment)

func _on_spikes_timer_timeout() -> void:
	queue_free()
