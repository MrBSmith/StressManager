extends ColorRect

var alpha : float = 0
var fade_in : bool = true

signal game_over

onready var clock_node = get_node("../Clock")
onready var daysleft_node = get_node("../DaysLeft")
onready var game_over_fade = get_node("/root/Master/GameOver/Fade")

signal black_out

func _ready():
	var _err
	_err = connect("black_out", clock_node, "on_black_out")
	_err = connect("game_over", game_over_fade, "on_game_over")
	set_process(false)

func _process(_delta):
	
	var fade_rate: float = 0.03
	
	# Increment or decrement the alpha value, based on the state of fade_in
	if fade_in == true:
		alpha += fade_rate
		if alpha > 1:
			alpha = 1
			fade_in = false
			emit_signal("black_out")
	elif fade_in == false:
		alpha -= fade_rate
		if alpha < 0:
			alpha = 0
			set_process(false)
	
	# Set the color of the fade
	var fade_color = Color(0, 0, 0, alpha)
	set_frame_color(fade_color)

func on_office_closing():
	if daysleft_node.get_days_left() > 1:
		set_process(true)
		fade_in = true
	else:
		emit_signal("game_over")

func on_game_over():
	hide()