extends HBoxContainer

@onready var powers : Array
@onready var audio_consume_powerup: AudioStreamPlayer2D = %AudioConsumePowerup

var current_sum: int = 0
var total_sum: int = 0

func _ready():
	powers = get_children()
	Game.set_shell.connect(move_pos_power)
	
func move_pos_power():
	current_sum = total_sum
	var last_power = powers[0]
	for power in powers:
		power.release_focus()
		
	for power in powers:
		if power.disabled:
			continue
		current_sum += power.power_cost
		if current_sum > Game.nb_shell:
			if last_power == powers[0]:
				return
			last_power.grab_focus()
			return
		if current_sum == Game.nb_shell:
			power.grab_focus()
			return
		last_power = power
	total_sum = current_sum
	move_pos_power()

func _on_consume_power():
	total_sum = 0
	audio_consume_powerup.play()
	Game.reduce_shell(current_sum)
