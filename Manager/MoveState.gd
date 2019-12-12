extends StateBase

onready var manager_node := self.owner

var target_pos := Vector2()
var speed : int = 2

# Handle the mouse right click
# Give the player, the mouse position as a target position, and ask the nav_2D_node for a path
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed && event.get_button_index() == BUTTON_RIGHT:
			target_pos.x = event.global_position.x as int
			target_pos.y = event.global_position.y as int

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