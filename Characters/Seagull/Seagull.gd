extends CharacterBody2D

@export var speed = 200.0
@export var drag := 5.0
@export var damage := 1
@export var fire_scale = 1.0
@export var drop_chance := 3

@onready var health: Health = $Health
@onready var engine = $Engine
@onready var shell_constructor = preload("res://Statics/Shell/Shell.tscn")

var fire_step = 0.1
var is_gold = false
var is_gold_go = false

func _physics_process(delta):
	if not is_gold or is_gold_go:
		var orientation = Vector2.DOWN if rotation_degrees == -180 else Vector2.UP
		var desired_velocity = orientation * speed
		var steering = desired_velocity - velocity
		velocity += steering / drag
		velocity = velocity.limit_length(speed)
		move_and_slide()
		anim_engine()

func take_damage(damage):
	health.loose_health(damage)

func _on_hit_box_body_entered(body: Node2D) -> void:
	health.loose_health(body.damage)
	body.queue_free()

func _on_health_dead() -> void:
	if is_gold:
		var shell = shell_constructor.instantiate()
		shell.position = position
		shell.init_gold_level()
		get_parent().add_child(shell)
	elif randi() % 10 < drop_chance:
		var shell = shell_constructor.instantiate()
		shell.position = position
		get_parent().add_child(shell)
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
			
func init_gold_level():
	$GPUParticles2D.emitting = true
	speed *= 2
	modulate = Color(1., 1., 0.03)
	is_gold = true
	$AnimationPlayer.play("gold_spawn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	is_gold_go = true
