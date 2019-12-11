extends Control

# Hide the buttons if the PNJ is not accessable
func on_accessable_change(accessable):
	if accessable == false:
		hide()

func on_button_pressed():
	hide()