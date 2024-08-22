extends Attracted

func _physics_process(delta):
	attract(delta)

func _on_body_entered(_body):
	Game.nb_shell += 1
	queue_free()
