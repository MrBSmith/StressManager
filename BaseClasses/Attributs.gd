extends Node

# Declare the possible traits of an employee
enum { LAZY, NORMIE, ZEALOUS }

# Declare the actual trait of the employee
const TRAIT = NORMIE
const NAME : String = "Nom" 

onready var manager_node = get_tree().get_root().get_node("Master/YSort/Manager")
onready var stress_jauge_node = get_node("../Jauges/Stress")
onready var productivity_jauge_node = get_node("../Jauges/Productivity")

signal stress_change
signal productivity_change

var accessable : bool = false setget set_accessable, get_accessable

var max_stress : int = 6
var max_productivity : int = 6
export var stress : int setget set_stress, get_stress
export var productivity : int setget set_productivity, get_productivity

# Connect the signals to the stress and productivity jauges 
func _ready():
	var _err
	_err = connect("stress_change", stress_jauge_node, "on_stress_change")
	_err = connect("productivity_change", productivity_jauge_node, "on_productivity_change")

func set_stress(value : int):
	if value >= 0 && value <= max_stress:
		stress = value
		emit_signal("stress_change")

func get_stress() -> int:
	return stress

func set_productivity(value : int):
	if value >= 0 && value <= max_productivity:
		productivity = value
		emit_signal("productivity_change")

func get_productivity() -> int:
	return productivity

func get_name() -> String:
	return NAME

func get_trait() -> int:
	return TRAIT

func set_accessable(value : bool):
	accessable = value

func get_accessable() -> bool:
	return accessable

func on_body_entered(body):
	if body == manager_node:
		set_accessable(true)

func on_body_exited(body):
	if body == manager_node:
		set_accessable(false)
