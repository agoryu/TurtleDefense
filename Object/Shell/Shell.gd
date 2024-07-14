extends Area2D

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

const DRAG := 14.0
var max_speed := 400.0

var _velocity := Vector2.ZERO
var is_attracted : bool = false

func _ready():
	animationPlayer.play("create")

func _physics_process(delta: float):
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
		_velocity += steering / DRAG
	else:
		_velocity = Vector2.ZERO
	position += _velocity * delta


func _on_body_entered(body):
	Game.nbShell += 1
	queue_free()
