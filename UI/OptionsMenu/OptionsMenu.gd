extends Control

signal close_options

@onready var language_button : OptionButton = $VBoxContainer/LanguageButton
@onready var master_slider : HSlider = $VBoxContainer/MasterSlider
@onready var music_slider : HSlider = $VBoxContainer/MusicSlider
@onready var sfx_slider : HSlider = $VBoxContainer/SFXSlider

func _ready() -> void:
	language_button.grab_focus()
	load_slider_values()
	update_settings()

func _on_save_button_up() -> void:
	update_settings()
	save_slider_values()
	visible = false

func _on_exit_button_up() -> void:
	visible = false

func _on_visibility_changed() -> void:
	if visible:
		language_button.grab_focus()
	else:
		emit_signal("close_options")

func save_slider_values():
	var config = ConfigFile.new()
	config.set_value("audio", "master", master_slider.value)
	config.set_value("audio", "music", music_slider.value)
	config.set_value("audio", "sfx", sfx_slider.value)
	config.save("user://options.cfg")

func load_slider_values():
	var config = ConfigFile.new()
	var err = config.load("user://options.cfg")
	if err == OK:
		if config.has_section_key("audio", "master"):
			master_slider.value = config.get_value("audio", "master")
		if config.has_section_key("audio", "music"):
			music_slider.value = config.get_value("audio", "music")
		if config.has_section_key("audio", "sfx"):
			sfx_slider.value = config.get_value("audio", "sfx")
			
func update_settings():
	TranslationServer.set_locale(language_button.text)
	AudioServer.set_bus_volume_db(0, linear_to_db(master_slider.value))
	AudioServer.set_bus_volume_db(1, linear_to_db(music_slider.value))
	AudioServer.set_bus_volume_db(2, linear_to_db(sfx_slider.value))
