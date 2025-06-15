extends Node2D

signal boss_battle_begin

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var boss_path : Path2D = $BossPath
@onready var path_follow : PathFollow2D = $BossPath/PathFollow2D
@onready var octopus_boss : CharacterBody2D = $BossPath/PathFollow2D/Octopus

#func _ready() -> void:
	#_on_area_begin_battle_body_entered(null)
	
func _physics_process(delta: float) -> void:
	if animation_player.is_playing():
		return
	path_follow.progress += octopus_boss.speed * delta
	if path_follow.progress_ratio >= 1.0:
		path_follow.progress_ratio = 1.0
		octopus_boss.speed = -abs(octopus_boss.speed)
	elif path_follow.progress_ratio <= 0.0:
		path_follow.progress_ratio = 0.0
		octopus_boss.speed = abs(octopus_boss.speed)

func _on_area_begin_battle_body_entered(body: Node2D) -> void:
	animation_player.play("begin")
	emit_signal("boss_battle_begin")
	
func howl_turtle() -> void:
	if is_instance_valid(Game.turtle):
		Game.turtle.howl()

func _on_area_stop_turtle_body_entered(body: Node2D) -> void:
	body.can_move = false
