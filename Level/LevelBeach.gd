extends Node2D

signal game_over

@onready var spawners : Node2D = $Spawners
@onready var turtle : CharacterBody2D = $Mobs/Turtle

func _process(delta: float) -> void:
	spawners.global_position.x = turtle.global_position.x

func _game_over() -> void:
	emit_signal("game_over")
