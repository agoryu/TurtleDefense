extends Node2D

@onready var animation_player = $AnimationPlayer

func _on_next_level_zone_body_entered(body):
	delete_enemy_object()
	animation_player.play("set_level")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "set_level":
		animation_player.play("RESET")

func delete_enemy_object():
	for enemy in get_tree().get_nodes_in_group("enemy"):
		enemy.queue_free()
	for object in get_tree().get_nodes_in_group("object"):
		object.queue_free()
