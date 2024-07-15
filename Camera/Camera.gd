extends Camera2D


func _ready():
	limit_left = 0
	limit_right = Game.screen_size.x
	limit_top = 0
	limit_bottom = Game.screen_size.y

