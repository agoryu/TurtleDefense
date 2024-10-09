extends Area2D

func _physics_process(delta):
	var target_enemy = get_nearest_enemy()
	if target_enemy != null:
		look_at(target_enemy.global_position)

func get_nearest_enemy():
	var enemies_in_range = get_overlapping_bodies()
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
