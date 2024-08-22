extends PowerButton

@export var value: int = 25

func action():
	Game.player.speed += value
