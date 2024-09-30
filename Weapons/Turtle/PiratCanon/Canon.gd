extends AnimatedSprite2D

@onready var _canonBall = preload("res://Weapons/Turtle/PiratCanon/CanonBall/CanonBall.tscn")
@onready var _fire_origin = $Fire_Origin
var is_active := false

func start():
	is_active = true
	visible = true

func fire():
	if is_active:
		_fire()

func _fire():
	var canonBall = _canonBall.instantiate()
	canonBall.global_position = _fire_origin.global_position
	get_tree().root.add_child(canonBall)
