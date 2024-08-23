extends PowerButton

@export var value: float = 0.1

func action():
	Game.player.bubble_gun.timer.wait_time -= value
