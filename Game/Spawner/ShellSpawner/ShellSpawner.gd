extends Node2D

@onready var timer: Timer = $Timer
@onready var shell_constructor = preload("res://Object/Shell/Shell.tscn")

func _on_timer_timeout():
	var shell = shell_constructor.instantiate()
	shell.global_position = Vector2(
		randi() % int(Game.screen_size.x),
		randi() % int(Game.screen_size.y))
	get_tree().root.add_child(shell)
	timer.start()
