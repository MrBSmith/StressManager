extends ColorRect

# This node take charge of the display of the stress jauge, it size, and its color

onready var attributes_node = get_node("../../Attributes")

func _ready():
	_update()

func _update():
	var stress = attributes_node.get_stress()
	set_size(Vector2(stress, 1))

func on_stress_change():
	_update()