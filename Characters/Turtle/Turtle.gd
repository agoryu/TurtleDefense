extends CharacterBody2D

@onready var timer: Timer = $Timer
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var animatedSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health: Health = $Health

@export var speed = 1000.0
@export var drag := 5.0

func _on_timer_timeout():
	var desired_velocity = Vector2.RIGHT * speed
	var steering = desired_velocity - velocity
	velocity += steering / drag
	velocity = velocity.limit_length(speed)
	move_and_slide()
	timer.start()
	animatedSprite.frame = (animatedSprite.frame + 1) % 2

func _on_area_2d_body_entered(body):
	health.loose_health(1)
	body.queue_free()
	animationPlayer.play("take_damage")
	Game.player.camera.take_damage()

func _on_health_dead():
	print("game over")

func _on_menu_area_body_entered(body):
	Game.can_open_menu = true

func _on_menu_area_body_exited(body):
	Game.can_open_menu = false
