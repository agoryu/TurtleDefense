extends Weapon

var level : int = 0;
@onready var gun = $Area2D/Gun
@export var maxLevel : int = 1;

func _ready():
	visible = false

func add_weapon():
	if level < maxLevel:
		gun.play("default")
		level += 1
		visible = true
