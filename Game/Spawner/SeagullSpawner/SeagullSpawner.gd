extends Node2D

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
	get_tree().get_root().add_child(seagull)

func _on_timer_timeout() -> void:
	spawn_seagull(seagull_constructor)

func get_alternative_path(altPath):
	if (altPath):
		return spawnerTop
	else:
		return spawnerBottom
