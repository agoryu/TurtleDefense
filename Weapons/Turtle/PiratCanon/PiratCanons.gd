extends Weapon

var _level : int = 0
var _canons = []
var _group = false

@export var maxLevel : int = 4
@onready var _canon_NE : AnimatedSprite2D = $Canon_NE
@onready var _canon_NW : AnimatedSprite2D = $Canon_NW
@onready var _canon_SE : AnimatedSprite2D = $Canon_SE
@onready var _canon_SW : AnimatedSprite2D = $Canon_SW
@onready var _timer : Timer = $Timer

func _ready():
	_canons = [_canon_NE, _canon_NW, _canon_SE, _canon_SW]
	for canon in _canons:
		canon.visible = false

func add_weapon():
	super()
	_timer.start()
	upgrade_primary_stat()

func upgrade_primary_stat():
	if _level < maxLevel:
		_upgrade_level()

func upgrade_secondary_stat():
	_timer.wait_time -= .5

func _upgrade_level():
	_canons[_level].start()
	_level += 1

func _on_timer_timeout() -> void:
	_group = !_group
	for canon in _canons:
		canon.fire(_group)
	_timer.start()
