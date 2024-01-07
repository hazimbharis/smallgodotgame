extends Node
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("CharacterBody3D")
	player.basis.x = Vector3(1,0,0)
	player.basis.y = Vector3(0,1,0)
	player.basis.z = Vector3(0,0,1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent) -> void:	
	if event.is_action_pressed("move_up"):
		player.position += -2*player.basis.z
	if event.is_action_pressed("move_down"):
		player.position += 2*player.basis.z
	if event.is_action_pressed("move_left"):
		player.position += -2*player.basis.x
	if event.is_action_pressed("move_right"):
		player.position += 2*player.basis.x
