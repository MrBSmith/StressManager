extends Node

onready var timer_node = get_node("Timer")
onready var attributes_node = get_parent()

func on_timeout():
	var prod = attributes_node.get_productivity()
	var stress = attributes_node.get_stress()
	
	if stress > 4:
		attributes_node.set_productivity(prod - 1)
		timer_node.set_wait_time(8)
	elif stress > 2:
		attributes_node.set_productivity(prod - 1)
		timer_node.set_wait_time(10)
	else:
		attributes_node.set_productivity(prod + 1)
		timer_node.set_wait_time(8)