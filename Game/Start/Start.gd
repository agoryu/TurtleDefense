extends Node2D

@onready var level_list = [preload("res://Level/LevelBeach.tscn")]

func _ready() -> void:
	load_level(0)

func load_level(level_number):
	var level = level_list[0].instantiate()
	add_child(level)
