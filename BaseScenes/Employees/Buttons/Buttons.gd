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
		loaf_button.hide()
		quit_button.show()
	else :
		loaf_button.show()
		quit_button.hide()
	
func on_button_pressed():
	hide()