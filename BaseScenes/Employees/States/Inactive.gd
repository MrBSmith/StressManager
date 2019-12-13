extends StateBase

####  INACTIVE STATE  ####

signal is_inactive

# When the employee is on this state, he will try to move towards the exit

onready var attributes_node = get_node("../../Attributes")
onready var employee_node = get_node("../..")
onready var states_node = get_parent()
onready var clock_node = get_node("/root/Master/HUD/Clock")
onready var end_of_work_node = get_node("/root/Master/HUD/EndOfWork")

onready var work_state = states_node.get_node("Work")

func _ready():
	clock_node.connect("new_day", self, "on_new_day")
	var _err = connect("is_inactive", end_of_work_node, "on_is_inactive")

func enter_state(_host):
	employee_node.hide()
	emit_signal("is_inactive")
	employee_node.position = attributes_node.work_position

func exit_state(_host):
	employee_node.show()

func on_new_day():
	if attributes_node.burnout == false:
		states_node.set_state(work_state)
	else:
		attributes_node.set_burnout(false)