extends Timer

onready var productivity_var_node = get_parent()

func _ready():
	var _err = connect("timeout", productivity_var_node, "on_timeout")