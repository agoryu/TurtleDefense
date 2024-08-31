extends CharacterBody2D

class_name Crab

@export var speed = 100.0
@export var drag := 5.0
@export var damage := 1
@export var anim_name := "walk_red"
@export var drop_chance := 3 ## Inverse of ( 1/X )

@onready var health: Health = $Health
@onready var shell_constructor = preload("res://Object/Shell/Shell.tscn")
@onready var animation = $SpriteSheet

func _ready() -> void:
	animate()

func _physics_process(delta):
	var desired_velocity = Vector2.LEFT * speed
	var steering = desired_velocity - velocity
	velocity += steering / drag
	velocity = velocity.limit_length(speed)
	move_and_slide()

func animate():
	animation.play(anim_name)

func _on_timer_timeout():
	queue_free()

func _on_area_2d_body_entered(body):
	body.queue_free()
	health.loose_health(body.damage)

func _on_health_dead():
	if randi() % 10 < drop_chance:
		var shell = shell_constructor.instantiate()
		shell.position = position
		get_parent().add_child(shell)
	queue_free()
