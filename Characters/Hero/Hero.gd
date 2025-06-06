extends CharacterBody2D

signal game_over

@export var speed = 300.0 :
	set(value):
		speed = value
		if is_instance_valid(speed_particles):
			speed_particles.emitting = true

@export var drag := 5.0

@onready var animationPlayer = $AnimationPlayer
@onready var health: Health = $Health
@onready var animation = $SpriteSheet
@onready var collision_damage = $DamageArea/CollisionShape2D
@onready var bubble_gun = $BubbleGun
@onready var camera: Camera2D = $Camera
@onready var health_particles: GPUParticles2D = $HealthParticles2D
@onready var speed_particles: GPUParticles2D = $SpeedParticles2D
@onready var attract_collision_shape: CollisionShape2D = $AttractArea/CollisionShape2D

var direction: Vector2

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
	update_shoot_direction()

func update_shoot_direction():
	var shoot_direction = get_gamepad_right_direction()
	if shoot_direction != Vector2.ZERO:
		bubble_gun.rotation = lerp_angle(bubble_gun.rotation, shoot_direction.angle(), 0.5)

func animate(direction):
	if direction != Vector2.ZERO:
		animation.play("walk")
	else:
		animation.play("default")

func get_gamepad_direction():
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()

func get_gamepad_right_direction():
	return Input.get_vector("ui_r_left", "ui_r_right", "ui_r_up", "ui_r_down").normalized()

func _on_area_2d_body_entered(body):
	health.loose_health(body.damage)
	animationPlayer.play("take_damage")

func _on_health_dead():
	emit_signal("game_over")

func nb_shoot_up():
	bubble_gun.nb_shoot_up()

func _on_health_add() -> void:
	health_particles.emitting = true
