extends Node2D

class_name Health

signal dead

@export var max_value: int = 5
var value: int

func _ready():
	value = max_value

func loose_health(x: int):
	value -= x
	if value <= 0:
		emit_signal("dead")
		
func add_health(x: int):
	value += x
	value = max(x, max_value)
