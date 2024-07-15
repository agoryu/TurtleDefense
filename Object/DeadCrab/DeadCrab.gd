extends Attracted

func _physics_process(delta):
	attract(delta)

func _on_body_entered(body):
	Game.nb_dead_crab += 1
	queue_free()
