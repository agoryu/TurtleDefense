extends Panel

@onready var weapons: VBoxContainer = $VBoxContainer/ScrollContainer/Weapons
@onready var audio_stream: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var particules: GPUParticles2D = $GPUParticles2D

func _ready() -> void:
	scale = Vector2.ZERO
	pivot_offset = size / 2

func _on_visibility_changed() -> void:
	if visible:
		focus_button()
	if is_instance_valid(particules):
		particules.emitting = visible
	animate()

func animate():
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)
	if visible:
		audio_stream.play()
		tween.tween_property(self, "scale", Vector2.ONE, 0.5)
	else:
		tween.tween_property(self, "scale", Vector2.ZERO, 0.3)

func focus_button():
	for weapon in weapons.get_children():
		if weapon.focus_button():
			return

func _on_boost_selected() -> void:
	focus_button()
