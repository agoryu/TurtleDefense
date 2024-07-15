extends Area2D

class_name Attracted

@export var drag := 14.0
@export var max_speed := 400.0

var _velocity := Vector2.ZERO
var is_attracted : bool = false

func attract(delta: float):
	var attractors : Array
	if not is_attracted:
		attractors = get_overlapping_areas()
	else:
		attractors = [Game.player]
		max_speed *= 1.1
		
	if attractors:
		var desired_velocity: Vector2 = (
			(attractors[0].global_position - global_position).normalized() * max_speed
		)
		var steering := desired_velocity - _velocity
		_velocity += steering / drag
	else:
		_velocity = Vector2.ZERO
	position += _velocity * delta
