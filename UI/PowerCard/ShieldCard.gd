extends Button

func _process(delta):
	disabled = Game.nb_shell < 5 and Game.nb_dead_crab < 2


func _on_button_up():
	pass # Replace with function body.
