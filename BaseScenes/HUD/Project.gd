extends Label

signal you_win

onready var you_win_node = get_node("/root/Master/YouWin/Fade")

export var project_percent : int setget set_project_percent, get_project_percent

func _ready():
	var _err = connect("you_win", you_win_node, "on_you_win")

func on_work_done():
	set_project_percent(project_percent + 1)

func set_project_percent(value : int):
	project_percent = value
	if project_percent >= 100:
		project_percent = 100
		emit_signal("you_win")
	elif project_percent < 0:
		project_percent = 0
	update_text()

func get_project_percent():
	return project_percent

func update_text():
	text = "projet:" + project_percent as String + "%"