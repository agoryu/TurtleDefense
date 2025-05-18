extends CharacterBody2D

@export var speed = 200.0
@export var drag := 5.0
@export var damage := 1
@export var fire_scale = 1.0

@onready var health: Health = $Health
@onready var engine = $Engine

var fire_step = 0.1

func _physics_process(delta):
	var orientation = Vector2.DOWN if rotation_degrees == -180 else Vector2.UP
	var desired_velocity = orientation * speed
	var steering = desired_velocity - velocity
	velocity += steering / drag
	velocity = velocity.limit_length(speed)
	move_and_slide()
	anim_engine()

func _on_timer_timeout():
	queue_free()

func take_damage(damage):
	health.loose_health(damage)

func _on_hit_box_body_entered(body: Node2D) -> void:
	health.loose_health(body.damage)
	body.queue_free()

func _on_health_dead() -> void:
	queue_free()

func anim_engine():
	if engine and speed > 0:
		if (fire_scale > 1.4 and fire_step > 0):
			fire_step = -0.05
		elif (fire_scale < 0.9 and fire_step < 0):
			fire_step = 0.05
		fire_scale += fire_step
		for fire in engine.get_children():
			fire.scale = Vector2.ONE * 0.05 * fire_scale
