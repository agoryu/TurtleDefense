extends Node2D

class_name Howl

@onready var particules : GPUParticles2D = $GPUParticles2D
@onready var audio_player : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var timer : Timer = $Timer

func activate():
	audio_player.play()
	particules.emitting = true
	timer.start()

func _on_timer_timeout() -> void:
	particules.emitting = false
