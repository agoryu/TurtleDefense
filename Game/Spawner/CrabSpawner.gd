extends Path2D

@onready var crab_constructor = preload("res://Characters/Crab/Crab.tscn")
@onready var pathFollow: PathFollow2D = $PathFollow2D
@onready var timer: Timer = $Timer

func _on_timer_timeout():
	var crab = crab_constructor.instantiate()
	pathFollow.progress_ratio = randf()
	crab.position = pathFollow.position
	add_child(crab)
	timer.start()
