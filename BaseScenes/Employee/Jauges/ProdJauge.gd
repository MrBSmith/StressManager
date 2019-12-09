extends ColorRect

onready var attributes_node = get_node("../../Attributes")

func update():
	var prod = attributes_node.get_productivity()
	set_size(Vector2(1, prod))