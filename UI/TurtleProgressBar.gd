extends ProgressBar

func _process(delta):
	max_value = Game.turtle.health.max_value
	value = Game.turtle.health.value
