extends Node2D

signal game_over

@onready var animation_player = $AnimationPlayer

func _ready():
	Game.turtle = $Turtle
	Game.player = $Hero

func set_level_animation():
	animation_player.play("set_level")

func _on_boss_timer_timeout() -> void:
	animation_player.play("boss_arrived")

func _game_over() -> void:
	emit_signal("game_over")
