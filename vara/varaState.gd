extends "res://state.gd"
class_name VaraState

const WAITING = "Waiting"
const FISHING = "Fishing"
var vara: Interactable

func _ready() -> void:
	await owner.ready
	vara = owner as Interactable
	assert(vara != null, "The varaState state type must be used only in the vara scene. It
	needs the owner to be a Interactable Node")
