extends CharacterBody2D

@export var speed = 100.0
@export var drag := 5.0
@export var damage := 1

@onready var health: Health = $Health

func _physics_process(delta):
	var desired_velocity = Vector2.LEFT * speed
	var steering = desired_velocity - velocity
	velocity += steering / drag
	velocity = velocity.limit_length(speed)
	move_and_slide()


func _on_timer_timeout():
	queue_free()

func _on_area_2d_body_entered(body):
	body.queue_free()
	health.loose_health(body.damage)

func _on_health_dead():
	queue_free()
