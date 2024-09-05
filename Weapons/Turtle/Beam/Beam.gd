extends AnimatedSprite2D

var level : int = 0;
@export var maxLevel : int = 1;

func _ready():
	visible = false

func Upgrade():
	if level < maxLevel:
		level += 1
		visible = true
		play("default")

func GetCurrentLevel() -> int:
	return level
