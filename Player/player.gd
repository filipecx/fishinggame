extends CharacterBody3D
class_name Player
@onready var animation = $AnimationTree
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var pivot = $CamOrigin
@onready var bodyMesh = $bonecoFishin2
@onready var stateMachine = $StateMachine
@export var sens = 0.5
@export var inventory:Inv

func collect(item):
	inventory.insert(item)

#func _ready() -> void:
	#pass
#
#func _input(event: InputEvent) -> void:
	#pass
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	#
	#if Input.is_action_just_pressed("quit"):
		#get_tree().quit()
	#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	##
	##var input_dir := Input.get_vector("left", "right", "up", "down")
	##var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	##if direction:
		##velocity.x = direction.x * SPEED
		##velocity.z = direction.z * SPEED
		##bodyMesh.look_at(direction + position, Vector3.UP)
	##else:
		##velocity.x = move_toward(velocity.x, 0, SPEED)
		##velocity.z = move_toward(velocity.z, 0, SPEED)
#
	#move_and_slide()
