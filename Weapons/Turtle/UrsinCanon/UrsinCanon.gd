extends AnimatedSprite2D

@onready var _ursin = preload("res://Weapons/Turtle/UrsinCanon/Ursin/Ursin.tscn")
@onready var _spike = preload("res://Weapons/Turtle/UrsinCanon/Spike/Spike.tscn")
@onready var _ursin_origin = $Ursin_Origin
var is_active := false

func start():
	is_active = true
	visible = true

func fire(ursinSpeed):
	if is_active:
		var ursin = _ursin.instantiate()
		ursin.initialize(_ursin_origin, ursinSpeed, _spike)
		get_tree().root.add_child(ursin)
