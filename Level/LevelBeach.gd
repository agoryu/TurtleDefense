extends Node2D

signal game_over

@onready var spawners : Node2D = $Spawners
@onready var turtle : CharacterBody2D = $Mobs/Turtle

@onready var animation_player = $AnimationPlayer

func _process(delta: float) -> void:
	spawners.global_position.x = turtle.global_position.x

func set_level_animation():
	animation_player.play("set_level")

func _on_boss_timer_timeout() -> void:
	animation_player.play("boss_arrived")

func _game_over() -> void:
	emit_signal("game_over")
