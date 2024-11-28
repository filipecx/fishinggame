extends State
class_name ManzuaState

const WAITING = "Waiting"
const FISHING = "Fishing"

var manzua: Interactable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	manzua = owner as Interactable
	assert(manzua != null, "The ManzuaState state type must be used only in the manzua scene. It
	needs the owner to be a Interactable Node")
