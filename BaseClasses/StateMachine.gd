extends Node

class_name StatesMachine

# Define the list of possible states, and give the path to the corresponding node for each state
# The states are distinguished by the name of their corresponding node
# The default state is always the first in the tree

onready var states_map = get_children()

onready var sprite_node = get_parent().find_node("Sprite")
onready var loafvisual_node = get_parent().find_node("LoafVisual")

onready var current_state : Object
onready var previous_state : Object

var state_name

signal state_changed

func _ready():
	var _err
	_err = connect("state_changed", sprite_node, "on_state_changed")
	_err = connect("state_changed", loafvisual_node, "on_state_changed")
	state_name = states_map[0].name
	set_state(get_node(state_name))

# Call for the current state process
func _physics_process(delta):
	var new_state_name = current_state.update(self, delta)
	if new_state_name:
		set_state(get_node(new_state_name))

# Set a new state
func set_state(new_state):
	
	# Discard the method if the new_state is the current_state
	if new_state == current_state:
		return
	
	# Use the exit state function of the current state
	if current_state != null:
		current_state.exit_state(self)
	
	# Change the current state, and the previous state
	previous_state = current_state
	current_state = new_state
	state_name = current_state.name
	
	# Use the enter_state function of the current state
	if new_state != null:
		current_state.enter_state(self)
	
	emit_signal("state_changed", state_name)

func get_state_name():
	return state_name

func on_loaf_order():
	set_state(get_node("Loaf"))

func on_work_order():
	set_state(get_node("Work"))

func on_workhard_order():
	set_state(get_node("WorkHard"))