extends Node2D

signal game_over

@onready var spawners : Node2D = $Spawners
@onready var turtle : CharacterBody2D = $Mobs/Turtle
@onready var crab_spawner = $Spawners/CrabSpawner
@onready var seagull_spawner = $Spawners/SeagullSpawner

func _process(delta: float) -> void:
	spawners.global_position.x = turtle.global_position.x

func _game_over() -> void:
	emit_signal("game_over")

func _on_octopus_area_battle_boss_battle_begin() -> void:
	crab_spawner.stop_spawn()
	seagull_spawner.stop_spawn()
