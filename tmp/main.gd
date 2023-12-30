extends Node3D
@onready var camera = $CharacterBody3D/Camera3D
@onready var player = $CharacterBody3D
var rotating = false

func _ready():
	player.transform.origin

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_text_caret_word_left"):
		rotating = false
	if !event.is_pressed():
		return
	if event.is_action_pressed("ui_text_caret_word_left"):
		rotating = true
	
	if rotating:
		print(player.rotation)
		if event.is_action("ui_up"):
			player.rotation.y += 0
		elif event.is_action("ui_right"):
			player.rotation.y -= deg_to_rad(90)
		elif event.is_action("ui_down"):
			player.rotation.y += deg_to_rad(180)
		elif event.is_action("ui_left"):
			player.rotation.y += deg_to_rad(90)
	else:
		if event.is_action("ui_left"):
			player.position.x -= 2
		elif event.is_action("ui_right"):
			player.position.x += 2
		elif event.is_action("ui_up"):
			player.position.z -= 2
		elif event.is_action("ui_down"):
			player.position.z += 2
