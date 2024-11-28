extends "res://playerState.gd"
class_name PlayerIdle
@onready var minigame = $"../../Fishing MinigameMain/Fishing MiniGame"
func Enter():
	print("to idle porraa")
	minigame.visible = false
	player = get_tree().get_first_node_in_group("Player")
	
	
func Update(_delta: float):
	player.animation.set("parameters/conditions/idle", true)
	if(Input.get_vector("down", "left", "right", "up").normalized()):	
		state_transition.emit(self, "Running")
		print("mudando state para andando")
func Exit():
	player.animation.set("parameters/conditions/idle", false)
	
