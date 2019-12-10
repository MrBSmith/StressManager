extends StateBase

signal work_done
signal stress_increase

onready var project_node := get_tree().get_root().get_node("Master/HUD/Project") 
onready var attributes_node := get_parent().get_parent().get_node("Attributes")
onready var workTimer_node := find_node("WorkTimer")

func _ready():
	var _err 
	_err = connect("work_done", project_node ,"on_work_done")
	_err = connect("stress_increase", attributes_node ,"on_stress_increase_done")

# At a interval of time based on the productivity, the work_done value is increased,
# Recalculate the interval each time the timer is finished
func on_worktimer_timeout():
	emit_signal("work_done")
	var prod = attributes_node.get_productivity()
	workTimer_node.set_wait_time(10 - prod)

# At a interval of time based on the character's trait, the stress value is increased,
# Recalculate the interval each time the timer is finished
func on_stressincreasetimer_timeout():
	var trait = attributes_node.get_trait()
	emit_signal("stress_increase")