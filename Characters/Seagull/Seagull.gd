extends CharacterBody2D

@export var speed = 200.0
@export var drag := 5.0
@export var damage := 1

@onready var health: Health = $Health

func _physics_process(delta):
	print(rotation_degrees)
	var orientation = Vector2.DOWN if rotation_degrees == -180 else Vector2.UP
	var desired_velocity = orientation * speed
	var steering = desired_velocity - velocity
	velocity += steering / drag
	velocity = velocity.limit_length(speed)
	move_and_slide()

func _on_timer_timeout():
	queue_free()

func take_damage(damage):
	health.loose_health(damage)

func _on_hit_box_body_entered(body: Node2D) -> void:
	health.loose_health(body.damage)
	body.queue_free()

func _on_health_dead() -> void:
	queue_free()
