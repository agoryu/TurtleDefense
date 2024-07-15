extends ProgressBar

func _process(delta):
	max_value = Game.player.health.max_value
	value = Game.player.health.value
