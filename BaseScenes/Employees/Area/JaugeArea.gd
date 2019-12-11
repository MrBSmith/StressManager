extends Area2D

# This node notifies the jauges node and the attributes node when the player enter the area

onready var attributes_node = get_node("../Attributes")
onready var jauge_node = get_node("../Jauges")
onready var loafvisual_node = get_node("../LoafVisual")
onready var sprite_node = get_node("../Sprite")

func _ready():
	var _err
	_err = connect("body_entered", attributes_node, "on_body_entered")
	_err = connect("body_entered", jauge_node, "on_body_entered")
	_err = connect("body_entered", loafvisual_node, "on_body_entered")
	_err = connect("body_entered", sprite_node, "on_body_entered")
	
	_err = connect("body_exited", attributes_node, "on_body_exited")
	_err = connect("body_exited", jauge_node, "on_body_exited")
	_err = connect("body_exited", loafvisual_node, "on_body_exited")
	_err = connect("body_exited", sprite_node, "on_body_exited")