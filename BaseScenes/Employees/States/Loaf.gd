extends StateBase

####  LOAF STATE  ####

# When the employee is on this state, his stress is slowly decreasing

signal stress_decrease

onready var attributes_node = get_node("../../Attributes")
onready var stress_decrease_timer_node = get_node("./StressDecreaseTimer")

# Set the timers actives when entering the state
func enter_state(_host):
	stress_decrease_timer_node.start()

# Set the timers inactives when exiting the state
func exit_state(_host):
	stress_decrease_timer_node.stop()

func _ready():
	var _err = connect("stress_decrease", attributes_node, "on_stress_decrease")

func on_stress_decrease_timer():
	emit_signal("stress_decrease")