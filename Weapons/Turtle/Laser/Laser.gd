extends Weapon

var lightningSize : int = 8
var lightningScene : PackedScene = preload("res://Weapons/Turtle/Laser/Lightning.tscn")
@onready var gunArea = $GunArea
@onready var gun = $GunArea/Gun
@onready var laserSpawn = $GunArea/Gun/Marker2D
@onready var timer = $Timer

func _ready():
	visible = false

func add_weapon():
	super()
	$AudioStreamPlayer2D.play()
	timer.start()
	gun.play("default")

func upgrade_primary_stat():
	super()
	timer.wait_time -= 0.2

func upgrade_secondary_stat():
	super()
	match secondaryLevel:
		2:
			damage = 2
			lightningSize = 12
		3:
			damage = 3
			lightningSize = 18

func _on_timer_timeout() -> void:
	var nearestEnemy = gunArea.get_nearest_enemy()
	gunArea.shoot()
	if nearestEnemy == null:
		return
	var lightning = lightningScene.instantiate()
	lightning.initialize(laserSpawn.global_position - global_position, nearestEnemy.global_position - global_position, lightningSize)
	add_child(lightning)
	lightning.animation_player.play("Fade")
	nearestEnemy.take_damage(damage)
