extends Label

var project_percent : int = 0 setget set_project_percent, get_project_percent

func on_work_done():
	set_project_percent(project_percent + 1)

func set_project_percent(value : int):
	project_percent = value
	if project_percent > 100:
		project_percent = 100
	elif project_percent < 0:
		project_percent = 0
	update_text()

func get_project_percent():
	return project_percent

func update_text():
	text = "projet:" + project_percent as String + "%"