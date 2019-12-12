extends Control

onready var hour_node = get_node("/root/Master/HUD/Clock")
onready var loaf_button = get_node("Loaf")
onready var quit_button = get_node("Quit")

# Hide the buttons if the PNJ is not accessable
func on_accessable_change(accessable):
	var hour = hour_node.get_hours()
	if accessable == false:
		hide()
	
	if hour > 16:
		quit_button.set_visible(true)
		quit_button.set_disabled(false)
		loaf_button.set_visible(false)
		loaf_button.set_disabled(true)
	else:
		loaf_button.set_visible(true)
		loaf_button.set_disabled(false)
		quit_button.set_visible(false)
		quit_button.set_disabled(true)
	
func on_button_pressed():
	hide()