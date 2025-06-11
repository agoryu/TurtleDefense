extends Node2D

@onready var level_list = [preload("res://Level/LevelBeach.tscn")]

func _ready() -> void:
	Game.start_scene = self
	load_level(0)

func load_level(level_number):
	if get_child_count() > 0:
		get_child(0).queue_free()
	add_child(level_list[0].instantiate())
