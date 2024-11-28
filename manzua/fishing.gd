extends ManzuaState
@onready var caixa = $"../../manzua"
@onready var animation = $"../../AnimationPlayer"
func Enter() -> void:
	animation.play("lowering")
	print("to fishiiinnggggg")
func Update(_delta: float) -> void:
	
	pass
func Exit() -> void:
	animation.play("up")
	
