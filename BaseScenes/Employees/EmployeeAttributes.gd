extends AttributesBase

# Declare the possible traits of an employee
enum { LAZY, NORMIE, ZEALOUS }

# Declare the actual trait of the employee
const TRAIT = NORMIE
const NAME : String = "Nom"

onready var manager_node = get_tree().get_root().get_node("Master/YSort/Manager")
onready var buttons_node = get_node("../Buttons")

signal accessible_change

var accessable : bool = false setget set_accessable, get_accessable

# Connect the signals to the stress and productivity jauges
func _ready():
	var _err
	_err = connect("accessible_change", buttons_node, "on_accessable_change")

func get_name() -> String:
	return NAME

func get_trait() -> int:
	return TRAIT

func set_accessable(value : bool):
	accessable = value
	emit_signal("accessible_change", accessable)

func get_accessable() -> bool:
	return accessable

func on_body_entered(body):
	if body == manager_node:
		set_accessable(true)

func on_body_exited(body):
	if body == manager_node:
		set_accessable(false)

func on_stress_increase_done():
	set_stress(stress + 1)