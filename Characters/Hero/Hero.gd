extends CharacterBody2D

@export var speed = 300.0
@export var drag := 5.0

@onready var wait_timer: Timer = $Timer
@onready var shoot = preload("res://Weapons/FirstWeapon/FirstWeapon.tscn")
@onready var animationPlayer = $AnimationPlayer
@onready var health: Health = $Health
@onready var animation = $SpriteSheet

var direction: Vector2
var shoot_direction: Vector2

func _physics_process(delta):
	direction = get_gamepad_direction()
	var desired_velocity = direction * speed
	var steering = desired_velocity - velocity
	velocity += steering / drag
	velocity = velocity.limit_length(speed)
	move_and_slide()
	animate(direction)
	position.x = clamp(position.x, 0, Game.screen_size.x)
	position.y = clamp(position.y, 0, Game.screen_size.y)

func animate(direction):
	if direction != Vector2.ZERO:
		animation.play("walk")
		shoot_direction = direction
	else:
		animation.play("default")

func get_gamepad_direction():
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()

func _input(event):
	if wait_timer.is_stopped() and event.is_action_pressed("ui_accept"):
		var shoot_bullet = shoot.instantiate()
		shoot_bullet.global_position = global_position
		shoot_bullet.transform.y = shoot_direction
		shoot_bullet.transform.x = -shoot_direction.orthogonal()
		get_parent().add_child(shoot_bullet)
		wait_timer.start()

func _on_area_2d_body_entered(body):
	health.loose_health(body.damage)
	animationPlayer.play("take_damage")

func _on_health_dead():
	print("game over")
