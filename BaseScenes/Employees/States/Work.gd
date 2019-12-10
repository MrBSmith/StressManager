extends StateBase

#####   WORK STATE   #####

# This node take charge of the behaviour of a employee when he is working

export var work_done_cooldown : int
export var stress_increase_cooldown : int

signal work_done
signal stress_increase

onready var project_node := get_tree().get_root().get_node("Master/HUD/Project") 
onready var attributes_node := get_parent().get_parent().get_node("Attributes")
onready var workTimer_node := find_node("WorkTimer")
onready var StressIncreaseTimer_node := find_node("StressIncreaseTimer")

# Connect the signals
func _ready():
	var _err 
	_err = connect("work_done", project_node ,"on_work_done")
	_err = connect("stress_increase", attributes_node ,"on_stress_increase_done")
	
	# Adapt the stress cooldown to the trait of the employee
	match attributes_node.get_trait():
		attributes_node.LAZY:
			stress_increase_cooldown = stress_increase_cooldown + ((stress_increase_cooldown as float /3) as int)
		attributes_node.NORMIE:
			pass
		attributes_node.ZEALOUS:
			stress_increase_cooldown = stress_increase_cooldown - ((stress_increase_cooldown as float /3) as int)

# At a interval of time based on the productivity, the work_done value is increased,
# Recalculate the interval each time the timer is finished
func on_worktimer_timeout():
	emit_signal("work_done")
	var prod = attributes_node.get_productivity()
	workTimer_node.set_wait_time(work_done_cooldown - prod)

# At a interval of time based on the character's trait, the stress value is increased,
# Recalculate the interval each time the timer is finished
func on_stressincreasetimer_timeout():
	emit_signal("stress_increase")
	StressIncreaseTimer_node.set_wait_time(stress_increase_cooldown)