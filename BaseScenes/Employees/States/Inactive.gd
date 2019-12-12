extends StateBase

####  INACTIVE STATE  ####

# When the employee is on this state, he will try to move towards the exit

onready var attributes_node = get_node("../../Attributes")
onready var employee_node = get_node("../..")
onready var states_node = get_parent()
onready var clock_node = get_node("/root/Master/HUD/Clock")

onready var work_state = states_node.get_node("Work")

func _ready():
	clock_node.connect("new_day", self, "on_new_day")

func enter_state(_host):
	employee_node.hide()
	employee_node.position = attributes_node.work_position

func exit_state(_host):
	employee_node.show()

func on_new_day():
	if attributes_node.burnout == false:
		states_node.set_state(work_state)
	else:
		attributes_node.set_burnout(false)