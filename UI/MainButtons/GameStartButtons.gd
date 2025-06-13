extends MainButton

@onready var start_constructor = preload("res://Game/Start/Start.tscn")

func _on_button_up() -> void:
	var tree_root = get_tree().root
	tree_root.remove_child(get_tree().get_nodes_in_group("mainMenu").get(0))
	tree_root.add_child(start_constructor.instantiate())
	
func _on_focus_entered() -> void:
	focus_animation()
