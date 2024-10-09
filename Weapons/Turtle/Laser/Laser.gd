extends Weapon

var level : int = 0;
var lightningScene : PackedScene = preload("res://Weapons/Turtle/Laser/Lightning.tscn")
@onready var gunArea = $GunArea
@onready var gun = $GunArea/Gun
@onready var laserSpawn = $GunArea/Gun/Marker2D
@onready var timer = $Timer
@export var maxLevel : int = 1;

func _ready():
	visible = false

func add_weapon():
	if level < maxLevel:
		timer.start()
		gun.play("default")
		level += 1
		visible = true

func _on_timer_timeout() -> void:
	var nearestEnemy = gunArea.get_nearest_enemy()
	if nearestEnemy == null:
		return
	var lightning = lightningScene.instantiate()
	lightning.initialize(laserSpawn.position, nearestEnemy.global_position)
	add_child(lightning)
	lightning.animation_player.play("Fade")
