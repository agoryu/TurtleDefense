extends Node2D

@onready var beam : AnimatedSprite2D = $Beam

func _ready():
	beam.visible = false

func _input(event):
	if event.is_action_pressed("add_turtle_weapon_1"):
		print("add_turtle_weapon_1")
		beam.Upgrade()
