extends Button

class_name MainButton

@onready var focus_sound_player : AudioStreamPlayer2D = $FocusSoundPlayer

func focus_animation():
	focus_sound_player.play()
	self.scale = Vector2.ONE
	var tween = create_tween()
	for i in range(2):
		tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "scale", Vector2(1, 1), 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
