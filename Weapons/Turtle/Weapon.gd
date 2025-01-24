extends Node2D

class_name Weapon

@onready var shoot_timer: Timer = $ShootTimer

@export var step : int = 1
@export var damage : int = 1
@export var cost_weapon : int = 2
@export var cost_boost1 : int = 2
@export var cost_boost2 : int = 2

func add_weapon():
	visible = true
	Game.reduce_shell(cost_weapon)

func _on_shoot_timer_timeout() -> void:
	action()

func action():
	pass

func upgrade_primary_stat():
	cost_boost1 += step

func upgrade_secondary_stat():
	cost_boost2 += step
