extends Node

class_name AttributesBase

onready var stress_jauge_node = get_node("../Jauges/Stress")
onready var productivity_jauge_node = get_node("../Jauges/Productivity")

signal stress_change
signal productivity_change

var max_stress : int = 6
var max_productivity : int = 6
var stress : int = 1 setget set_stress, get_stress
var productivity : int = 3 setget set_productivity, get_productivity

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