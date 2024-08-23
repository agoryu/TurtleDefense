extends CharacterBody2D

@export var speed = 600.0
@export var damage = 1

@onready var timer: Timer = $Timer
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_shoot: AudioStreamPlayer2D = $AudioShoot

func _ready():
	sprite.frame = randi() % 4
	audio_shoot.play()

func _physics_process(delta):
	var direction = Vector2(sin(rotation), -cos(rotation))
	move_and_collide(direction.normalized() * speed * delta)

func _on_timer_timeout():
	queue_free()
