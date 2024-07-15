extends Button

func _process(delta):
	disabled = Game.nb_shell < 5

func _on_button_up():
	Game.turtle.health.max_value += 5
	Game.nb_shell -= 5
