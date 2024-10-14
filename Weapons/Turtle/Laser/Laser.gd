extends Weapon

var isShooting : bool = false
var primaryLevel : int = 0
var secondaryLevel : int = 0
var lightningSize : int = 8
var lightningScene : PackedScene = preload("res://Weapons/Turtle/Laser/Lightning.tscn")
@onready var gunArea = $GunArea
@onready var gun = $GunArea/Gun
@onready var laserSpawn = $GunArea/Gun/Marker2D
@onready var timer = $Timer
@export var maxPrimaryLevel : int = 1
@export var maxSecondaryLevel : int = 1

func _ready():
	visible = false

func add_weapon():
	if primaryLevel == 0 and secondaryLevel == 0:
		timer.start()
		gun.play("default")
		primaryLevel += 1
		secondaryLevel += 1
		visible = true

func upgrade_primary_stat():
	if primaryLevel < maxPrimaryLevel:
		primaryLevel += 1
		timer.wait_time -= 0.2

func upgrade_secondary_stat():
	if secondaryLevel < maxSecondaryLevel:
		secondaryLevel += 1
		match secondaryLevel:
			2:
				damage = 2
				lightningSize = 12
			3:
				damage = 4
				lightningSize = 18

func _on_timer_timeout() -> void:
	if isShooting:
		return
	var nearestEnemy = gunArea.get_nearest_enemy()
	if nearestEnemy == null:
		return
	var lightning = lightningScene.instantiate()
	lightning.initialize(laserSpawn.global_position - global_position, nearestEnemy.global_position - global_position, lightningSize)
	add_child(lightning)
	lightning.animation_player.play("Fade")
	nearestEnemy.take_damage(damage)
