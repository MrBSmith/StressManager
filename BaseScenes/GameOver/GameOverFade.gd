extends ColorRect

var alpha : float = 0

onready var label_node = get_node("../Label")

signal fade_finished

func _ready():
	var _err = connect("fade_finished", label_node, "on_fade_finished")
	set_process(false)

func _process(_delta):
	
	var fade_rate: float = 0.05
	
	# Increment or decrement the alpha value, based on the state of fade_in
	alpha += fade_rate
	if alpha > 1:
		alpha = 1
		emit_signal("fade_finished")
		set_process(false)
	
	# Set the color of the fade
	var fade_color = Color(0, 0, 0, alpha)
	set_frame_color(fade_color)

func on_game_over():
	set_process(true)