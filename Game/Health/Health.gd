extends Node2D

class_name Health

signal dead

@onready var explosion_constructor = preload("res://Object/Explosion/Explosion.tscn")
@export var max_value: int = 5
var value: int

func _ready():
	value = max_value

func loose_health(x: int):
	value -= x
	if value <= 0:
		var explosion = explosion_constructor.instantiate()
		explosion.global_position = get_parent().global_position
		get_tree().root.add_child(explosion)
		explosion.animate()
		emit_signal("dead")
		
func add_health(x: int):
	value += x
	value = max(x, max_value)
