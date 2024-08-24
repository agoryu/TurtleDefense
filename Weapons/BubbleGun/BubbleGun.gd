extends Node2D

@onready var timer: Timer = $Timer
@onready var weapons = %Weapons
@onready var bubble_constructor = preload("res://Weapons/BubbleGun/Bubble.tscn")
@onready var sprite = %AnimatedSprite2D
@onready var sprite_timer: Timer = %AnimatedSprite2D/SpriteTimer

var nb_weapon_activated: int = 1
var can_shoot: bool = false

func _ready():
	sprite.frame = 0

func _physics_process(delta: float) -> void:
	if can_shoot and timer.is_stopped():
		shoot()
		timer.start()

func _input(event):
	if event.is_action_pressed("shoot"):
		can_shoot = true
	elif event.is_action_released("shoot"):
		can_shoot = false
		
func shoot():
	change_sprite()
	for i in range(nb_weapon_activated):
		var bubble = bubble_constructor.instantiate()
		bubble.global_position = weapons.get_child(i).global_position
		if i == 0:
			bubble.global_rotation = global_rotation + PI / 2
		elif i % 2 == 0:
			bubble.global_rotation = global_rotation + PI / 2 + ((PI / 6) * get_multiplicator_angle(i))
		else:
			bubble.global_rotation = global_rotation + PI / 2 - ((PI / 6) * get_multiplicator_angle(i))
		get_tree().root.add_child(bubble)
	timer.start()
		
func get_multiplicator_angle(pos: int):
	if pos > 2:
		return 2
	elif pos == 0:
		return 0
	else:
		return 1

func change_sprite():
	sprite.frame += 1
	sprite_timer.start()
	
func _on_sprite_timer_timeout():
	sprite.frame -= 1
	
func nb_shoot_up():	
	nb_weapon_activated += 2
	if nb_weapon_activated == 3:
		sprite.frame = 2
	elif nb_weapon_activated == 5:
		sprite.frame = 4
