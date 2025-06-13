extends Control

signal close_options

@onready var language_button : OptionButton = $VBoxContainer/LanguageButton
@onready var master_slider : HSlider = $VBoxContainer/MasterSlider
@onready var music_slider : HSlider = $VBoxContainer/MusicSlider
@onready var sfx_slider : HSlider = $VBoxContainer/SFXSlider

func _ready() -> void:
	language_button.grab_focus()
	master_slider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(2))

func _on_save_button_up() -> void:
	TranslationServer.set_locale(language_button.text)
	AudioServer.set_bus_volume_db(0, linear_to_db(master_slider.value))
	AudioServer.set_bus_volume_db(1, linear_to_db(music_slider.value))
	AudioServer.set_bus_volume_db(2, linear_to_db(sfx_slider.value))
	visible = false

func _on_exit_button_up() -> void:
	visible = false

func _on_visibility_changed() -> void:
	if visible:
		language_button.grab_focus()
	else:
		emit_signal("close_options")
