extends ColorRect

onready var attributes_node = get_node("../../Attributes")

func _ready():
	_update()

# Update the display
func _update():
	var prod = attributes_node.get_productivity()
	set_size(Vector2(prod, 1))

# Call an update each time the productivity change
func on_productivity_change():
	_update()