extends PowerButton

@export var value: float = 0.1

func action():
	Game.player.wait_timer.wait_time -= value
