extends Node2D

@export var spawn_time = 5.

@onready var seagull_constructor = preload("res://Characters/Seagull/Seagull.tscn")
@onready var spawnerTop: PathFollow2D = $Path2DTop/PathFollow2DTop
@onready var spawnerBottom: PathFollow2D = $Path2DBottom/PathFollow2DBottom
@onready var timer: Timer = $Timer

func spawn_seagull(constructor):
	var altPath = randi() % 2 == 0
	var path = get_alternative_path(altPath)
	path.progress_ratio = randf()

	var seagull = constructor.instantiate()
	seagull.position = path.global_position
	seagull.rotation_degrees = 180 if (altPath) else 0
	var value_rand = randi() % 20
	if randi() % 20 < 3:
		seagull.init_gold_level()
	get_tree().get_root().add_child(seagull)

func _on_timer_timeout() -> void:
	spawn_seagull(seagull_constructor)
	if timer.wait_time > spawn_time:
		timer.wait_time = spawn_time

func get_alternative_path(altPath):
	if (altPath):
		return spawnerTop
	else:
		return spawnerBottom
		
func stop_spawn():
	timer.stop()
