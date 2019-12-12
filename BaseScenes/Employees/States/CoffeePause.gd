extends StateBase

####  COFFEE PAUSE STATE  ####

# When the employee is on this state, his stress is slowly decreasing

onready var attributes_node = get_node("../../Attributes")
onready var employee_node = get_node("../..")
onready var coffee_break_end_timer_node = get_node("CoffeeBreakEnd")
onready var state_node = get_parent()

onready var target_position = attributes_node.get_coffee_position()

# connect the signals
func _ready():
	coffee_break_end_timer_node.connect("timeout", self, "on_coffee_break_end")

func update(_host, _delta):
	if employee_node.position != target_position:
		return "Move"

# Set the timers actives when entering the state
func enter_state(_host):
	coffee_break_end_timer_node.start()

# Set the timers inactives when exiting the state
func exit_state(_host):
	coffee_break_end_timer_node.stop()

func on_coffee_break_end():
	if state_node.get_state() == self:
		state_node.set_state(state_node.get_node("Work"))