extends Node

signal set_shell

var screen_size: Vector2 = Vector2(1920, 1080)

var player
var turtle

var nb_shell = 0

func add_shell(value: int):
	nb_shell += value
	emit_signal("set_shell")

func reduce_shell(value: int):
	nb_shell -= value
	emit_signal("set_shell")
