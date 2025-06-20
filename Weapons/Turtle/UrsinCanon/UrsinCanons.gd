extends Weapon

var _ursinCanons = []
var _level : int = 0;

@export var ursinSpeed : int = 100;

@onready var _ursinCanons_NE : AnimatedSprite2D = $UrsinCanon_NE
@onready var _ursinCanons_NW : AnimatedSprite2D = $UrsinCanon_NW
@onready var _ursinCanons_SE : AnimatedSprite2D = $UrsinCanon_SE
@onready var _ursinCanons_SW : AnimatedSprite2D = $UrsinCanon_SW
@onready var _timer : Timer = $Timer

func _ready():
	_ursinCanons = [_ursinCanons_NE, _ursinCanons_NW, _ursinCanons_SE, _ursinCanons_SW]
	for ursinCanon in _ursinCanons:
		ursinCanon.visible = false

func add_weapon():
	super()
	_timer.start()
	_ursinCanons[primaryLevel-1].start()

func upgrade_primary_stat():
	super()
	_ursinCanons[primaryLevel-1].start()

func upgrade_secondary_stat():
	super()
	_timer.wait_time -= 1.

func _on_timer_timeout() -> void:
	for ursinCanon in _ursinCanons:
		ursinCanon.fire(ursinSpeed, damage);
	_timer.start()
