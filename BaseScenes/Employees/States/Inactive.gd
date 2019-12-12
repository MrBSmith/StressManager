extends StateBase

####  INACTIVE STATE  ####

# When the employee is on this state, he will try to move towards the exit

onready var attributes_node = get_node("../../Attributes")
onready var employee_node = get_node("../..")

func enter_state(_host):
	employee_node.hide()
	employee_node.position = attributes_node.work_position

func exit_state(_host):
	employee_node.show()