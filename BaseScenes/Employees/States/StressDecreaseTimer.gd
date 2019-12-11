extends Timer

onready var work_state_node = get_parent()

func _ready():
	var _err = connect("timeout", work_state_node, "on_stress_decrease_timer")