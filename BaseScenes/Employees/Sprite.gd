extends Sprite

onready var manager_node = get_tree().get_root().get_node("Master/YSort/Manager")
onready var state_node = get_node("../States")

var red_color = "ff7272"
var normal_color = "ffffff"

func on_state_changed(state_name):
	if state_name == "WorkHard":
		set_modulate(red_color)
	else:
		set_modulate(normal_color)

func on_body_entered(body):
	if body == manager_node && state_node.get_state_name() == "WorkHard":
		set_modulate(red_color)

func on_body_exited(body):
	if body == manager_node:
		set_modulate(normal_color)