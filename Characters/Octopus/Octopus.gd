extends CharacterBody2D

@onready var howl_scene : Howl = $Howl
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var area_damage : Area2D = $Area2D
@onready var attack_position : Marker2D = $AttackPosition

@onready var attack_constructor = preload("res://Characters/Octopus/MegaBubble/MegaBubble.tscn")

@export var life : ProgressBar
@export var speed : int = 100

func howl():
	howl_scene.activate()
	area_damage.monitoring = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	life.value -= body.damage
	body.queue_free()
	animation_player.play("take_damage")


func _on_attack_timer_timeout() -> void:
	var mega_bubble = attack_constructor.instantiate() as CharacterBody2D
	mega_bubble.position = attack_position.position
	mega_bubble.global_rotation_degrees = -90
	add_child(mega_bubble)
