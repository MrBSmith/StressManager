extends ColorRect

# This node take charge of the display of the stress jauge, it size, and its color

onready var attributes_node = get_node("../../Attributes")

var green_color = "00cc00"
var yellow_color = "ffff00"
var red_color = "ff0000"

func _ready():
	_update()

func _update():
	var stress = attributes_node.get_stress()
	match stress:
		1, 2:
			set_modulate(green_color)
		3, 4:
			set_modulate(yellow_color)
		5, 6:
			set_modulate(red_color)
	set_size(Vector2(stress, 1))

func on_stress_change():
	_update()