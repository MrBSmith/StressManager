extends Control

onready var manager_node = get_tree().get_root().get_node("Master/YSort/Manager")

func _ready():
	visible = false

func on_body_entered(body):
	if body == manager_node:
		visible = true

func on_body_exited(body):
	if body == manager_node:
		visible = false