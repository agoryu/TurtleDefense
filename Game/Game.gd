extends Node

signal set_shell

var screen_size: Vector2 = Vector2(1920, 1080)

var player
var turtle
var start_scene

var nb_shell = 0

func add_shell(value: int):
	nb_shell += value
	emit_signal("set_shell")

func reduce_shell(value: int):
	nb_shell -= value
	emit_signal("set_shell")
	
func reset_scene() -> void:
	for enemy in get_tree().get_nodes_in_group("enemy"):
		enemy.queue_free()
	for projectile in get_tree().get_nodes_in_group("projectile"):
		projectile.queue_free()
	for object in get_tree().get_nodes_in_group("object"):
		object.queue_free()
	start_scene.load_level(0)
