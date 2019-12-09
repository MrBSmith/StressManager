extends Node

# Declare the possible traits of an employee
enum { LAZY, NORMIE, ZEALOUS }

# Declare the actual trait of the employee
const TRAIT = NORMIE
const NAME : String = "Nom" 

onready var manager_node = get_tree().get_root().get_node("Master/YSort/Manager")

var accessable : bool = false setget set_accessable, get_accessable

var max_stress : int = 6
var max_productivity : int = 6
var stress : int = 2 setget set_stress, get_stress
var productivity : int = 3 setget set_productivity, get_productivity

func set_stress(value : int):
	if value >= 0 && value <= max_stress:
		stress = value

func get_stress() -> int:
	return stress

func set_productivity(value : int):
	if value >= 0 && value <= max_productivity:
		productivity = value

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
