extends Node2D

@onready var animation = $AnimatedSprite

func animate():
	animation.play("default")


func _on_animated_sprite_2d_animation_finished():
	queue_free()
