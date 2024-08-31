extends Button

class_name PowerButton

signal consume_power

@onready var player = Game.player

@export var max_up: int = 1

var num_up: int = 1
var power_cost: int = 1

func valid_power():
	emit_signal("consume_power")
	num_up += 1
	if num_up > max_up:
		disabled = true
	power_cost += 1
	action()

func action():
	pass
