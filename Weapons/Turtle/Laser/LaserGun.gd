extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = get_nearest_enemy(enemies_in_range)
		look_at(target_enemy.global_position)

func get_nearest_enemy(enemies):
	if (enemies.size() == 1):
		return enemies[0]
	var closestEnemy = null
	var closest_distance = INF
	for enemy in enemies:
		var distance = global_position.distance_squared_to(enemy.global_position)
		if distance < closest_distance:
			closest_distance = distance
			closestEnemy = enemy
	return closestEnemy
