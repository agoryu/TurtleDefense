extends Node2D

var level : int = 0;
@export var maxLevel : int = 4;
@onready var canonNE : AnimatedSprite2D = $NE
@onready var canonNW : AnimatedSprite2D = $NW
@onready var canonSE : AnimatedSprite2D = $SE
@onready var canonSW : AnimatedSprite2D = $SW

func _ready():
	canonNE.visible = false
	canonNW.visible = false
	canonSE.visible = false
	canonSW.visible = false

func Upgrade():
	if level < maxLevel:
		_upgrade_level()
	else:
		return

func GetCurrentLevel() -> int:
	return level

func _upgrade_level():
	level += 1
	match level:
		1:
			canonNE.visible = true
		2:
			canonNW.visible = true
		3:
			canonSE.visible = true
		4:
			canonSW.visible = true
