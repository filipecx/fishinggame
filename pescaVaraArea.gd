extends "res://interactable.gd"


@onready var state_machine = $VaraStateMachine
@onready var player = get_tree().get_first_node_in_group("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact(body) -> void:
	if state_machine.current_state.name == "Waiting":
		state_machine.change_state(state_machine.current_state, "Fishing")
		player.stateMachine.change_state(player.stateMachine.current_state, "Fishing")
	elif state_machine.current_state.name == "Fishing":
		state_machine.change_state(state_machine.current_state, "Waiting")
	interacted.emit(body)
