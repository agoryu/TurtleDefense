extends Node2D

@onready var timer: Timer = $Timer
@onready var shell_constructor = preload("res://Statics/Shell/Shell.tscn")
@onready var collision_shape : CollisionShape2D = $Area2D/CollisionShape2D

@export var turtle_distance : int = 300

func _on_timer_timeout():
	var shell = shell_constructor.instantiate()
	var size = collision_shape.shape.extents
	var position_area = Vector2(
		(randi() % int(size.x)) - (size.x/2) + collision_shape.global_position.x,
		(randi() % int(size.y)) - (size.y/2) + collision_shape.global_position.y
	)
	shell.global_position = position_area
	get_tree().root.add_child(shell)
	timer.start()
