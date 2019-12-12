extends StatesMachine

onready var loafvisual_node = get_node("../LoafVisual")
onready var sprite_node = get_node("../Sprite")

signal state_changed

func _ready():
	var _err
	_err = connect("state_changed", loafvisual_node, "on_state_changed")
	_err = connect("state_changed", sprite_node, "on_state_changed")

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

func get_state():
	return current_state

func on_loaf_order():
	set_state(get_node("Loaf"))

func on_work_order():
	set_state(get_node("Work"))

func on_workhard_order():
	set_state(get_node("WorkHard"))

func on_quit_order():
	set_state(get_node("Quit"))