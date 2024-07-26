extends Node2D

@onready var animation_player = $AnimationPlayer

func _ready():
	Game.turtle = $Turtle
	Game.player = $Hero

func set_level_animation():
	animation_player.play("set_level")
