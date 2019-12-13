extends Node

signal office_closing

onready var fade_node = get_node("../Fade")
onready var employees_array: Array = get_tree().get_nodes_in_group("Employees")

func _ready():
	var _err = connect("office_closing", fade_node, "on_office_closing")

func on_is_inactive():
	if are_employees_all_inactives():
		emit_signal("office_closing")

func are_employees_all_inactives() -> bool:
	for employee in employees_array:
		var state_name = employee.get_node("States").get_state().name
		if state_name != "Inactive":
			return false
	return true
	