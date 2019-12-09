extends StateBase

onready var manager_node = get_node("../../")
var target_pos := Vector2()
var speed : int = 2

# Handle the mouse left click
# Give the player, the mouse position as a target position
func _input(event):
	if event is InputEventMouseButton:
		target_pos.x = event.position.x as int
		target_pos.y = event.position.y as int

func update(_host, _delta):
	# Move toward the target if it exists and if it's not the player position
	if target_pos != Vector2() && manager_node.position != target_pos :
		move_towards(target_pos)

# Handle the mouvement
func move_towards(tar_pos : Vector2):
	
	var direction = manager_node.position.direction_to(tar_pos)
	var velocity = direction * speed
	var pos = manager_node.position
	
	# Check if the movement will place the character further than the target, if it is, place it on the target, and empty the target variable
	if x_near(pos, tar_pos) && y_near(pos, tar_pos):
		manager_node.position = tar_pos
		tar_pos = Vector2()
	else:
		if !manager_node.test_move(manager_node.transform, velocity):
			manager_node.move_and_collide(velocity)

func x_near(pos, tar_pos) -> bool:
	return pos.x < tar_pos.x + speed && pos.x > tar_pos.x - speed

func y_near(pos, tar_pos) -> bool:
	return pos.y < tar_pos.y + speed && pos.y > tar_pos.y - speed