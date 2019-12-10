extends Control

# This node take charge of setings the jauge visible or not, when desired

onready var manager_node = get_tree().get_root().get_node("Master/YSort/Manager")

func _ready():
	visible = false

# if the player enter the area, set the jauges visible
func on_body_entered(body):
	if body == manager_node:
		visible = true

# if the player exit the area, set the jauges not visible
func on_body_exited(body):
	if body == manager_node:
		visible = false