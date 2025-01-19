extends Weapon

var level : int = 0;
@export var maxLevel : int = 1;

func _ready():
	visible = false

func add_weapon():
	if level < maxLevel:
		level += 1
		visible = true
