extends AnimatedSprite2D

@export var ballSpeed : int = 400
@onready var _canonBall = preload("res://Weapons/Turtle/PiratCanon/CanonBall/CanonBall.tscn")
@onready var _fire_origin = $Fire_Origin
var is_active := false

func start():
	is_active = true
	visible = true

func fire(group):
	if is_active && _fire_origin.group == group:
		var canonBall = _canonBall.instantiate()
		canonBall.initialize(_fire_origin, ballSpeed)
		get_tree().root.add_child(canonBall)
