extends CharacterBody3D

@export var speed = 20
@export var gravity = -10

var target = Vector3.ZERO

func _physics_process(delta):
	velocity.y += gravity * delta
	if target:
		look_at(target, Vector3.UP)
		rotation.x = 0
		velocity = -transform.basis.z * speed
		if transform.origin.distance_to(target) < .8:
			target = Vector3.ZERO
			velocity = Vector3.ZERO
	move_and_slide()
