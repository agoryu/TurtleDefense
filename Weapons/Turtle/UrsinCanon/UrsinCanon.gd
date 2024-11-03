extends AnimatedSprite2D

@onready var _ursinCanonBall = preload("res://Weapons/Turtle/UrsinCanon/Ursin/Ursin.tscn")
@onready var _ursin_origin = $Ursin_Origin
var is_active := false

func start():
	is_active = true
	visible = true

func fire(ursinSpeed):
	if is_active:
		var ursinCanonBall = _ursinCanonBall.instantiate()
		ursinCanonBall.initialize(_ursin_origin, ursinSpeed)
		get_tree().root.add_child(ursinCanonBall)
