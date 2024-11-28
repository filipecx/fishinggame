extends "res://playerState.gd"

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	print("andando")
	
func Update(_delta: float):
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		player.velocity.x = direction.x * player.SPEED
		player.velocity.z = direction.z * player.SPEED
		player.bodyMesh.look_at(direction + player.position, Vector3.UP)
		player.animation.set("parameters/conditions/walk", true)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)
		player.animation.set("parameters/conditions/walk", false)
		state_transition.emit(self, "Idle")
	player.move_and_slide()
