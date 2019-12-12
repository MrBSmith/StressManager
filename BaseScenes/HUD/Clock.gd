extends Label

export var hours : int setget set_hours, get_hours
export var minutes : int setget set_minutes, get_minutes
var hours_string : String = "08"
var minutes_string : String = "00"

const NORMAL_COLOR = "ffffff"
const YELLOW_COLOR = "ffff00"
const RED_COLOR = "ff0000"

signal new_day
#signal work_time

func _ready():
	var DaysLeft_node = get_node("../DaysLeft")
	var _err = connect("new_day", DaysLeft_node, "on_new_day")

func _on_Timer_timeout():
	time_increment()
	text_display()
	text = hours_string + ":" + minutes_string

# Make the minute increase at each call, make the hours increase if necesary, and so on for the days
func time_increment():
	set_minutes(minutes + 10)
	if minutes == 0:
		set_hours(hours + 1)
		if hours == 0:
			emit_signal("new_day")

# Convert the integer value of hours and minutes, as displayable text
func text_display():
	if hours < 10:
		hours_string = "0" + hours as String
	else:
		hours_string = hours as String
	if minutes == 0:
		minutes_string = "00"
	else:
		minutes_string = minutes as String
	
	text_color()

# Handle the text color, relative to the hour of the day
func text_color():
	if hours < 17:
		set_modulate(NORMAL_COLOR)
	elif hours < 20:
		set_modulate(YELLOW_COLOR)
	else: 
		set_modulate(RED_COLOR)

func wrap_hours():
	if hours >= 24:
		set_hours(0)

func wrap_minutes():
	if minutes >= 60:
		set_minutes(0)

func set_hours(value : int):
	hours = value
	wrap_hours()

func get_hours() -> int:
	return hours

func set_minutes(value : int):
	
# warning-ignore:integer_division
	value = (value/10) * 10
	minutes = value
	wrap_minutes()

func get_minutes() -> int:
	return hours
