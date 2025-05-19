extends CharacterBody2D

@onready var howl_scene : Howl = $Howl
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var area_damage : Area2D = $Area2D

@export var life : ProgressBar

func howl():
	howl_scene.activate()
	area_damage.monitoring = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	life.value -= body.damage
	body.queue_free()
	animation_player.play("take_damage")
