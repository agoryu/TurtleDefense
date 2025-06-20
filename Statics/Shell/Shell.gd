extends Attracted

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@export var value: int = 1

func _ready():
	animationPlayer.play("create")

func _physics_process(delta: float):
	attract(delta)

func _on_body_entered(body):
	Game.add_shell(value)
	animationPlayer.play("consume")
	
func init_level_2():
	value = 2
	modulate = Color(0.10, 0.48, 1)
	
func init_gold_level():
	value = 10
	modulate = Color(1., 1., 0.03)
