extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D
@onready var shield_generator: AnimatedSprite2D = $ShieldGenerator
@export var character_collision_shape: CollisionShape2D
@export var shield_life: int = 2
@export var maxLevel : int = 1;

var level : int = 0;
var shield_value: int = 2
var is_activate: bool = false:
	set(value):
		if is_activate and value:
			shield_value += shield_life
			return
		sprite.visible = value
		#character_collision_shape.disabled = value
		collision_shape.disabled = !shield_value

func _ready():
	is_activate = false
	shield_generator.visible = false

func add_weapon():
	if level < maxLevel:
		level += 1
		shield_generator.visible = true

func _on_area_2d_body_entered(body):
	shield_value -= 1
	if shield_value < 1:
		is_activate = false
		shield_value = shield_life
