extends Node2D

var nb_dots_visible : int = 0

onready var dots_node_array : Array = get_children()
onready var manager_node = get_tree().get_root().get_node("Master/YSort/Manager")
onready var state_node = get_node("../States")
onready var attributes_node = get_node("../Attributes")

# On each timer end, increment the dot number variable, and show n dots, based on this variable
func on_timeout():
	increment_dot()
	show_dots()

# Increment the dot value, wrap it on > 3
func increment_dot():
	nb_dots_visible += 1
	if nb_dots_visible > 3:
		nb_dots_visible = 0

# Decide witch dot should be shown or not
func show_dots():
	if nb_dots_visible == 0:
		for dot in range(len(dots_node_array) - 1):
			dots_node_array[dot].hide()
	else:
		dots_node_array[nb_dots_visible - 1].show()

func on_state_changed(state_name):
	if state_name == "Loaf" && attributes_node.get_accessable():
		show()
	else:
		hide()

func on_body_entered(body):
	if body == manager_node && state_node.get_state_name() == "Loaf":
		show()

func on_body_exited(body):
	if body == manager_node:
		hide()