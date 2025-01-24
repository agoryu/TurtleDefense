extends Weapon

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D
@onready var shield_generator: AnimatedSprite2D = $ShieldGenerator
@export var character_collision_shape: CollisionShape2D
@export var shield_life: int = 2
@export var maxLevel : int = 1
@export var regeneration_value : float = 0.2

var level : int = 0;
var shield_value: int = 2
var is_activate: bool = false:
	set(value):
		is_activate = value
		if value:
			shield_value = shield_life
			animation_player.play("open")
		else:
			animation_player.play("close")
		sprite.visible = value
		collision_shape.disabled = !value

func _ready():
	is_activate = false
	shield_generator.visible = false

func add_weapon():
	super()
	level += 1
	shield_generator.visible = true
	is_activate = true
	visible = true

func upgrade_primary_stat():
	if level < maxLevel:
		level += 1
		shoot_timer.wait_time -= regeneration_value

func upgrade_secondary_stat():
	shield_life += 1

func _on_area_2d_body_entered(body):
	shield_value -= 1
	body.health.loose_health(body.health.max_value)
	sprite.material.set_shader_parameter("attack_angle", self.get_angle_to(body.global_position))
	animation_player.play("impact")
	if shield_value < 1:
		is_activate = false
		shoot_timer.start()

func _on_timer_timeout() -> void:
	is_activate = true
	
func clear_attack_impact():
	sprite.material.set_shader_parameter("attack_angle", 0.0)
	sprite.material.set_shader_parameter("active", false)
