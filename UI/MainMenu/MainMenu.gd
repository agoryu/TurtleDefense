extends Control

@onready var start_button : Button = %GameStartButtons

func _ready() -> void:
	start_button.grab_focus()
	TranslationServer.set_locale("fr")

func _on_options_menu_close_options() -> void:
	start_button.grab_focus()
