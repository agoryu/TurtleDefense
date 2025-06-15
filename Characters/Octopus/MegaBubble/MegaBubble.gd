extends CharacterBody2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var health : Health = $Health
@export var speed = 50.0
@export var damage = 5

var can_move = false

func _ready() -> void:
	animation_player.play("create")

func _physics_process(delta):
	if can_move:
		var direction = Vector2(sin(rotation), -cos(rotation))
		move_and_collide(direction.normalized() * speed * delta)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "damage" in body and health.value > 0:
		health.loose_health(body.damage)
		animation_player.play("damage")
		body.queue_free()

func _on_health_dead() -> void:
	$Sprite2D.visible = false
	$CollisionShape2D.disabled = true
	$ExplosionStreamPlayer2D.play()
	set_collision_layer_value(3, false)
	
func take_damage(damage_value):
	if health.value > 0:
		health.loose_health(damage_value)
		animation_player.play("damage")

func _on_explosion_stream_player_2d_finished() -> void:
	queue_free()

func switch_can_move():
	var old_global_pos = global_position
	var root = get_tree().root
	get_parent().remove_child(self)
	root.add_child(self)
	global_position = old_global_pos
	can_move = true
