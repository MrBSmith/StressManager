extends Area2D

onready var attributes_node = get_node("../Attributes")
onready var jauge_node = get_node("../Jauges")

func _ready():
	var _err
	_err = connect("body_entered", attributes_node, "on_body_entered")
	_err = connect("body_entered", jauge_node, "on_body_entered")
	_err = connect("body_exited", attributes_node, "on_body_exited")
	_err = connect("body_exited", jauge_node, "on_body_exited")