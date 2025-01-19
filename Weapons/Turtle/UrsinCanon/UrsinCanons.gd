extends Weapon

var _ursinCanons = []
var _level : int = 0;

@export var maxLevel : int = 4;
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
	_timer.start()
	upgrade_primary_stat()

func upgrade_primary_stat():
	if _level < maxLevel:
		_upgrade_level()

func upgrade_secondary_stat():
	_timer.wait_time -= .5

func _upgrade_level():
	_ursinCanons[_level].start()
	_level += 1

func _on_timer_timeout() -> void:
	for ursinCanon in _ursinCanons:
		ursinCanon.fire(ursinSpeed);
	_timer.start()
