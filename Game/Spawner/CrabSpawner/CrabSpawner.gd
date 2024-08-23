extends Path2D

@onready var crab_red_constructor = preload("res://Characters/Crab/CrabRed.tscn")
@onready var crab_green_constructor = preload("res://Characters/Crab/CrabGreen.tscn")
@onready var crab_blue_constructor = preload("res://Characters/Crab/CrabBlue.tscn")
@onready var pathFollow: PathFollow2D = $PathFollow2D
@onready var timer_next_level: Timer = $TimerNextLevel
@onready var timer_red: Timer = $TimerRed
@onready var timer_green: Timer = $TimerGreen
@onready var timer_blue: Timer = $TimerBlue

var level: int = 0

func spawn_crab(constructor):
	var crab = constructor.instantiate()
	pathFollow.progress_ratio = randf()
	crab.position = pathFollow.position
	add_child(crab)

func _on_timer_red_timeout() -> void:
	spawn_crab(crab_red_constructor)

func _on_timer_green_timeout() -> void:
	spawn_crab(crab_green_constructor)

func _on_timer_blue_timeout() -> void:
	spawn_crab(crab_blue_constructor)

func _on_timer_next_level_timeout() -> void:
	level += 1
	match level:
		1:
			timer_red.wait_time = 1.5
			timer_green.start()
		2:
			timer_green.wait_time = 2
			timer_blue.start()
		_:
			timer_next_level.stop()
