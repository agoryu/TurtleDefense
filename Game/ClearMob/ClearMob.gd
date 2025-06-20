extends VisibleOnScreenNotifier2D

func _on_screen_exited() -> void:
	$Timer.start()

func _on_timer_timeout() -> void:
	if not is_on_screen():
		get_parent().queue_free()
