extends Area2D

var _isShooting = false
var enemies_in_range = []
@onready var _gunAreaTimer = $GunAreaTimer

func shoot():
	_isShooting = true
	_gunAreaTimer.start()

func _physics_process(delta):
	var target_enemy = get_nearest_enemy()
	if target_enemy != null:
		look_at(target_enemy.global_position)

func get_nearest_enemy():
	if _isShooting:
		return

	if enemies_in_range.size() == 0:
		return null
	if (enemies_in_range.size() == 1):
		return enemies_in_range[0]
	var closestEnemy = null
	var closest_distance = INF
	for enemy in enemies_in_range:
		var distance = global_position.distance_squared_to(enemy.global_position)
		if distance < closest_distance:
			closest_distance = distance
			closestEnemy = enemy
	return closestEnemy

func _on_gun_area_timer_timeout() -> void:
	_isShooting = false

func _on_body_entered(body: CharacterBody2D) -> void:
	enemies_in_range.append(body);

func _on_body_exited(body: Node2D) -> void:
	enemies_in_range.erase(body)
