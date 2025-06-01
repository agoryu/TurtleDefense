extends CharacterBody2D

@onready var health : Health = $Health
@export var speed = 50.0
@export var damage = 5

func _physics_process(delta):
	var direction = Vector2(sin(rotation), -cos(rotation))
	move_and_collide(direction.normalized() * speed * delta)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "damage" in body:
		health.loose_health(body.damage)
		body.queue_free()

func _on_health_dead() -> void:
	queue_free()
	
func take_damage(damage_value):
	health.loose_health(damage_value)
