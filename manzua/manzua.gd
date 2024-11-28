extends Interactable
@onready var state_machine = $StateMachineManzua

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact(body) -> void:
	if state_machine.current_state.name == "Waiting":
		state_machine.change_state(state_machine.current_state, "Fishing")
	elif state_machine.current_state.name == "Fishing":
		state_machine.change_state(state_machine.current_state, "Waiting")
	interacted.emit(body)
