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
