extends Node2D
@onready var top_pivot:Node2D = $TopPivot
@onready var bot_pivot:Node2D = $BottomPivot
@onready var fish:Sprite2D = $FishIndicator
@onready var hook:Sprite2D = $Hook
@onready var success_screen = $"../Control"
@onready var new_fish_position: Vector2 = Vector2(top_pivot.position.x, top_pivot.position.y * 2)
@onready var label = $"../Control/Label"
@export var item: InventoryItem
var success_counter = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	success_screen.visible = false
	pass
	

func generateNewY() -> float:
	var number = RandomNumberGenerator.new().randi_range(top_pivot.position.y, bot_pivot.position.y)
	return number

func verify_if_hook_is_on_fish() -> void:
	var hook_top = hook.position.y - hook.scale.y / 2
	var hook_bot = hook.position.y + hook.scale.y / 2
	
	if fish.position.y > hook_top && fish.position.y < hook_bot:
		pull_hook()
		
	else:
		pass
		#print("fish tá fora do hook")
	
func pull_hook():
	if Input.is_action_just_pressed("click"):
			success_counter += 1
			print(success_counter)
			if success_counter >= 3:
				deal_if_success()
				print("pescou!!")
				
func deal_if_success():
	var player = get_tree().get_first_node_in_group("Player")
	player.collect(item)
	label.show_fish(item)
	success_screen.visible = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	verify_if_hook_is_on_fish()
	fish.position = fish.position.lerp(new_fish_position, delta * 4.0)
	hook.position = Vector2(top_pivot.position.x, hook.position.lerp(get_local_mouse_position(), delta * 6.0).y )
	if hook.position.y <= top_pivot.position.y:
		hook.position.y = top_pivot.position.y
	elif hook.position.y >= bot_pivot.position.y:
		hook.position.y = bot_pivot.position.y	
	
func calculate_position(newY: float) -> Vector2:
	var new_position:Vector2 = Vector2(bot_pivot.position.x, newY)
	return new_position

func _on_timer_timeout() -> void:
	new_fish_position = calculate_position(generateNewY())
