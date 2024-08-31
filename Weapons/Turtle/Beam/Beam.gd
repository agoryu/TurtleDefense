extends AnimatedSprite2D

var level : int = 0;
@export var maxLevel : int = 1;

func Upgrade():
	if level < maxLevel:
		level += 1
		visible = true

func GetCurrentLevel() -> int:
	return level
