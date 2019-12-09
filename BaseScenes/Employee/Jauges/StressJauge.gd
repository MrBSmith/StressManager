extends ColorRect

onready var attributes_node = get_node("../../Attributes")

func update():
	var stress = attributes_node.get_stress()
	set_size(Vector2(1, stress))