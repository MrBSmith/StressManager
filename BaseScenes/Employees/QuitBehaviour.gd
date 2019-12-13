extends Node

onready var attributes_node = get_node("../Attributes")
onready var states_node = get_node("../States")
onready var trait = attributes_node.TRAIT
onready var clock_node = get_node("/root/Master/HUD/Clock")

func _ready():
	clock_node.connect("time_changed", self, "on_time_changed")

func on_time_changed(hour):
	# Discard the function if the hour is under 17
	if hour <= 16:
		return
	
	var current_state = states_node.get_state()
	var quit_state = states_node.get_node("Quit")
	
	# Discard the function if the employee is already quitting or is inacitve
	if current_state.name == "Inactive" or current_state.name == "Quit":
		return
		
	var threshold : float = 0.5 + (hour - 16) / 2
	
	if hour > 22:
		states_node.set_state(quit_state)
	else:
		if is_threshold_overwhelmed(threshold) == true:
			states_node.set_state(quit_state)

# Return true if the rng is inferior to the threshold
func is_threshold_overwhelmed(threshold : float) -> bool:
	var rng = rand_range(0.0, 10.0)
	
	match trait:
		attributes_node.LAZY:
			if rng < threshold + 2:
				return true
		attributes_node.NORMIE:
			if rng < threshold:
				return true
		attributes_node.ZEALOUS:
			if rng < threshold - 2:
				return true
	return false