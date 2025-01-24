extends Weapon

var _primary_stat : int = 0;
var _secondary_stat : int = 0;
var _shots = []
var _shotIndex = 0
@export var _max_primary_stat : int = 3;
@export var _max_secondary_stat : int = 3;
@export var _shot_speed : int = 500;

@onready var _shot = preload("res://Weapons/Turtle/Multishot/BulletShot/Shot.tscn")
@onready var _shot_1 : Marker2D = $Shot1
@onready var _shot_2 : Marker2D = $Shot2
@onready var _shot_3 : Marker2D = $Shot3
@onready var _shot_4 : Marker2D = $Shot4
@onready var _shot_5 : Marker2D = $Shot5
@onready var _shot_6 : Marker2D = $Shot6
@onready var _shot_7 : Marker2D = $Shot7
@onready var _shot_8 : Marker2D = $Shot8
@onready var _shotShift : Timer = $ShotShift
@onready var _shotDelay : Timer = $ShotDelay

func _ready():
	visible = false
	_shots = [_shot_1, _shot_2, _shot_3, _shot_4, _shot_5, _shot_6, _shot_7, _shot_8]

func add_weapon():
	super()
	_primary_stat += 1
	_shotShift.start()

func upgrade_primary_stat():
	if _primary_stat < _max_primary_stat:
		_primary_stat += 1

func upgrade_secondary_stat():
	if _secondary_stat < _max_secondary_stat:
		_shotDelay.wait_time -= .4

func shoot():
	var shot = _shot.instantiate()
	shot.initialize(_shots[_shotIndex], _shot_speed)
	_shotIndex += 1
	get_tree().root.add_child(shot)

func _on_shot_shift_timeout() -> void:
	shoot()
	if (_shotIndex < _shots.size()):
		_shotShift.start()
	else:
		_shotShift.stop()
		_shotDelay.start()

func _on_shot_delay_timeout() -> void:
	_shotDelay.stop()
	_shotIndex = 0
	_shotShift.start()
