extends CharacterBody2D

@export var speed = 100.0
@export var drag := 5.0
@export var damage := 1

@onready var health: Health = $Health
@onready var shell_constructor = preload("res://Object/Shell/Shell.tscn")
@onready var animation = $SpriteSheet

func _physics_process(delta):
	var desired_velocity = Vector2.LEFT * speed
	var steering = desired_velocity - velocity
	velocity += steering / drag
	velocity = velocity.limit_length(speed)
	animate()
	move_and_slide()

func animate():
	animation.play("walk_red")

func _on_timer_timeout():
	queue_free()

func _on_area_2d_body_entered(body):
	body.queue_free()
	health.loose_health(body.damage)

func _on_health_dead():
	if randi() % 10 < 3:
		var shell = shell_constructor.instantiate()
		shell.position = position
		get_parent().add_child(shell)
	queue_free()
