extends ProgressBar

@onready var life_bar: ProgressBar = $LifeBar
@onready var timer: Timer = $Timer
@export var health: Health

func _ready():
	health.loose.connect(loose_health)
	health.add.connect(add_health)
	add_health()

func loose_health():
	life_bar.value = health.value
	timer.start()

func add_health():
	value = health.value
	max_value = health.max_value
	life_bar.value = health.value
	life_bar.max_value = health.max_value

func _on_timer_timeout():
	create_tween().tween_property(self, "value", health.value, 1.0)
