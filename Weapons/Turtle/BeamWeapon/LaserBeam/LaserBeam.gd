extends RayCast2D

class_name LaserBeam

@onready var _fill := $FillLine2D
@onready var _tween := create_tween()
@onready var _casting_particles = $CastingParticles2D
@onready var _beam_particles = $BeamParticles2D
@onready var _collision_particles = $CollisionParticles2D
@onready var _timer = $Timer
@onready var _audio_stream_player = $AudioStreamPlayer

@onready var line_width: float = _fill.width

@export var max_length := 3000
@export var growth_time := 0.1
@export var speed := 100
@export var damage_caused := 2

var is_casting : bool = false: set = set_is_casting

func _ready():
	set_physics_process(false)
	_fill.points[1] = Vector2.ZERO

func action() -> void:
	target_position = (target_position + Vector2.RIGHT * speed).limit_length(max_length)
	cast_beam()
	
func cast_beam():
	var cast_point = target_position
	force_raycast_update()
	
	_collision_particles.emitting = is_colliding()
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		_collision_particles.global_rotation = get_collision_normal().angle()
		_collision_particles.position = cast_point
		var collider = get_collider()
		collider.add_damage(damage_caused)
		_audio_stream_player.play()
		
	_fill.points[1] = cast_point
	_beam_particles.position = cast_point * 0.5
	_beam_particles.process_material.emission_box_extents.x = cast_point.length() * 0.5

func appear():
	if _tween.is_running():
		_tween.stop()
	_tween.interpolate_property(_fill, "width", 0, line_width, growth_time * 2)
	_tween.start()
	_audio_stream_player.play()
	_timer.start()
	
func disappear():
	if _tween.is_running():
		_tween.stop()
	_tween.interpolate_property(_fill, "width", line_width, 0, growth_time)
	_tween.start()

func set_is_casting(cast: bool):
	is_casting = cast
	if is_casting:
		target_position = Vector2.ZERO
		_fill.points[1] = target_position
		appear()
	else:
		_collision_particles.emitting = false
		disappear()
	
	set_physics_process(is_casting)
	_casting_particles.emitting = is_casting
	_beam_particles.emitting = is_casting

func end_action():
	set_is_casting(false)
