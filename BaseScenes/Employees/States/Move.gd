extends StateBase

onready var employee_node = get_node("../..")
onready var attributes_node = get_node("../../Attributes")

onready var speed = attributes_node.get_speed()

var target_pos := Vector2()

func enter_state(host):
	target_pos = host.previous_state.target_position

# Move the employee towards the target position, reset to the previous state
func update(host, _delta):
	var pos = employee_node.position
	
	if pos != target_pos:
		move_towards(target_pos)
	else:
		return host.previous_state.name

# Handle the movement of this instance
func move_towards(tar_pos : Vector2):
	
	var direction = employee_node.position.direction_to(tar_pos)
	var velocity = direction * speed
	var pos = employee_node.position
	
	# Check if the movement will place the character further than the target, if it is, place it on the target, and empty the target variable
	if x_near(pos, tar_pos) && y_near(pos, tar_pos):
		employee_node.position = tar_pos
		tar_pos = Vector2()
	else:
		if !employee_node.test_move(employee_node.transform, velocity):
			employee_node.move_and_collide(velocity)

# Return true if the employee is nearer than his speed from the target point
func x_near(pos, tar_pos) -> bool:
	return pos.x < tar_pos.x + speed && pos.x > tar_pos.x - speed

func y_near(pos, tar_pos) -> bool:
	return pos.y < tar_pos.y + speed && pos.y > tar_pos.y - speed