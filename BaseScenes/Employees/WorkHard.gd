extends ButtonBase

onready var state_node = get_node("../../States")

func _ready():
	var _err
	_err = connect("button_up", state_node, "on_workhard_order")