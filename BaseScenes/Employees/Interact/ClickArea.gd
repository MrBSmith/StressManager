extends TextureButton

onready var attributes_node = get_parent().get_node("../Attributes")
onready var buttons_node = get_parent().get_node("../Buttons")

# Set the buttons visibles, if the player press the left button while the PNJ is accessable
func on_pressed():
	var accessable = attributes_node.get_accessable()
	if accessable == true:
		buttons_node.show()