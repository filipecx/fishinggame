extends CollisionObject3D
class_name Interactable
signal interacted(body)
@export var prompt_message = "Interact"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func interact(body) -> void:
	interacted.emit(body)
