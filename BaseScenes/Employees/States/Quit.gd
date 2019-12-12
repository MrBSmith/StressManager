extends StateBase

####  QUIT STATE  ####

# When the employee is on this state, he will try to move towards the exit

onready var employee_node = get_node("../..")

var target_position = Vector2(42, 17)

func update(_host, _delta):
	if employee_node.position != target_position:
		return "Move"
	else:
		return "Inactive"