extends PowerButton

@export var value: int = 20

func action():
	Game.player.attract_collision_area.shape.radius += value
