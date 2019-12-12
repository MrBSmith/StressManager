extends AttributesBase

# Declare the possible traits of an employee
enum { LAZY, NORMIE, ZEALOUS }

# Declare the actual trait of the employee
const TRAIT = NORMIE
const NAME : String = "Nom"

onready var manager_node = get_tree().get_root().get_node("Master/YSort/Manager")
onready var buttons_node = get_node("../Buttons")
onready var employee_node = get_parent()

onready var work_position = employee_node.position setget set_work_position, get_work_position

var coffee_position := Vector2(60, 23) setget set_coffee_position, get_coffee_position
var photocopie_position := Vector2(17, 53) setget set_photocopie_position, get_photocopie_position

signal accessible_change

var accessable : bool = false setget set_accessable, get_accessable
var speed : int = 1 setget set_speed, get_speed

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

func on_stress_increase():
	set_stress(stress + 1)

func on_stress_decrease():
	set_stress(stress - 1)

func set_work_position(value: Vector2):
	work_position = value

func get_work_position() -> Vector2:
	return work_position

func set_coffee_position(value: Vector2):
	coffee_position = value

func get_coffee_position() -> Vector2:
	return coffee_position

func set_photocopie_position(value: Vector2):
	photocopie_position = value

func get_photocopie_position() -> Vector2:
	return photocopie_position

func set_speed(value : int):
	speed = value

func get_speed() -> int:
	return speed
