extends Control

@onready var start_button : Button = %GameStartButtons

func _ready() -> void:
	start_button.grab_focus()
