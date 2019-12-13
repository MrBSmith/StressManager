extends Label

export var days_left : int setget set_days_left, get_days_left

func _ready():
	update_text()

func on_new_day():
	set_days_left(days_left - 1)
	update_text()

func set_days_left(value : int):
	days_left = value

func get_days_left() -> int:
	return days_left

func update_text():
	text = days_left as String + "j.restants"