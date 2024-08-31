extends PanelContainer

@onready var powers : Array
@onready var audio_consume_powerup: AudioStreamPlayer2D = %AudioConsumePowerup
@onready var progress_bar: ProgressBar = $ProgressBar

func _ready():
	powers = $PowerMenu.get_children()
	Game.set_shell.connect(move_pos_power)
	progress_bar.max_value = powers.size()
	progress_bar.value = 0

func move_pos_power():
	var last_power = powers[0]
	var nb_shell = Game.nb_shell
	progress_bar.value = nb_shell
	for power in powers:
		power.release_focus()

	if nb_shell < 1:
		return

	if nb_shell >= progress_bar.max_value:
		powers[powers.size() - 1].grab_focus()
		return

	for i in range(powers.size()):
		if nb_shell * powers.size() / progress_bar.max_value >= i + 1:
			powers[i].grab_focus()
		else:
			return

func _on_consume_power():
	progress_bar.value = 0
	progress_bar.max_value = progress_bar.max_value + (ceil(progress_bar.max_value * 20 / 100))
	audio_consume_powerup.play()
	Game.reduce_shell(Game.nb_shell)
