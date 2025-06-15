extends CharacterBody2D

signal game_over

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var animatedSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health: Health = $Health
@onready var beam_weapon : Weapon = $Weapons/BeamWeapon

@onready var ursin_canon_weapon = $Weapons/UrsinCanon
@onready var armor_weapon = $Weapons/Shield
@onready var multishot_weapon = $Weapons/MultiShot
@onready var pirat_canon_weapon = $Weapons/PiratCanon
@onready var laser_weapon = $Weapons/Laser
@onready var howl_scene : Howl = $Howl

@export var speed = 30.0
@export var drag := 5.0

var level = 0
var can_move = true : 
	set(value) :
		can_move = value
		if not can_move:
			animatedSprite.stop()
		else:
			animatedSprite.play("default")

func _ready() -> void:
	animatedSprite.play("default")
	Game.turtle = self

func _physics_process(delta):
	if can_move:
		var desired_velocity = get_desired_velocity()
		var steering = desired_velocity - velocity
		velocity += steering / drag
		velocity = velocity.limit_length(speed)
	else :
		velocity = Vector2.ZERO
	move_and_slide()

func _on_area_2d_body_entered(body):
	health.loose_health(1)
	body.queue_free()
	animationPlayer.play("take_damage")

func _on_health_dead():
	emit_signal("game_over")

func get_desired_velocity():
	if animatedSprite.frame >= 1 and animatedSprite.frame <= 2:
		return Vector2.RIGHT * speed
	else:
		return Vector2.ZERO

func howl():
	howl_scene.activate()
