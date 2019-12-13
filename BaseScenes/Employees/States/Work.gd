extends WorkStateBase

onready var coffeebreak_node = get_node("CoffeeBreakTimer")

# Connect signals
func _ready():
	coffeebreak_node.connect("timeout", self, "on_coffeebreak_timeout")

func enter_state(_host):
	workTimer_node.start()
	StressIncreaseTimer_node.start()
	coffeebreak_node.set_wait_time(rand_range(20.0, 40.0))
	coffeebreak_node.start()

func exit_state(_host):
	coffeebreak_node.stop()

func on_coffeebreak_timeout():
	if state_node.get_state() == self:
		state_node.set_state(state_node.get_node("CoffeePause"))