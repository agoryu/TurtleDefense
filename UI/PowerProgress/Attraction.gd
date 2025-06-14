extends PowerButton

@export var value: int = 20

func action():
	Game.player.boost_attraction(value)
