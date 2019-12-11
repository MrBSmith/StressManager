extends Timer

onready var loaf_visual_node = get_parent()

func _ready():
	var _err = connect("timeout", loaf_visual_node, "on_timeout")