extends PowerButton

@export var value: int = 5

func action():
	Game.player.health.add_health(value)
