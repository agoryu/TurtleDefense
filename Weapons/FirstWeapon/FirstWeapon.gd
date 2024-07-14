extends CharacterBody2D


@export var speed = 600.0

@onready var timer: Timer = $Timer

func _physics_process(delta):
	var direction = Vector2(sin(rotation), -cos(rotation))
	move_and_collide(direction.normalized() * speed * delta)

func _on_timer_timeout():
	queue_free()
