extends Attracted

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

func _ready():
	animationPlayer.play("create")

func _physics_process(delta: float):
	attract(delta)

func _on_body_entered(body):
	Game.nb_shell += 1
	queue_free()
