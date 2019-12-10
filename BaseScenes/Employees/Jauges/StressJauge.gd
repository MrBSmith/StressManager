extends ColorRect

onready var attributes_node = get_node("../../Attributes")

func _ready():
	_update()

func _update():
	var stress = attributes_node.get_stress()
	set_size(Vector2(stress, 1))

func on_stress_change():
	_update()