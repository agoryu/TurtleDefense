extends Line2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

var divider : float = 10
var point_lerp : Array = []
var _sway : float = 10
var sway_divider : float = 1

func initialize(start : Vector2, target : Vector2) -> void:
	add_point(start)
	add_point(target)
	var from_to = target - start
	segmentize(from_to, start)
	sway(Vector2(from_to.y, -from_to.x).normalized())


func segmentize(from_to : Vector2, start_pos: Vector2) -> void:
	point_lerp.clear()
	var distance : float = from_to.length()
	var segment_count : int = distance/divider
	for point in range(0, segment_count):
		point_lerp.append(randf())
	point_lerp.sort()
	var point_index : int = 1
	for point_offset in point_lerp:
		add_point(start_pos + point_offset * from_to, point_index)
		point_index += 1

func sway(normal : Vector2) -> void:
	var point_count : int = get_point_count() - 1
	for point in point_count:
		if point == 0 or point == point_count:
			continue
		else:
			var offset = ((get_point_position(point) + get_point_position(point - 1))/2) + normal * randi_range(-_sway, _sway)
			set_point_position(point, offset)
