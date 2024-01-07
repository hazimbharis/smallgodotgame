extends Node3D
@onready var camera = $CharacterBody3D/Camera3D
@onready var player = $CharacterBody3D
@onready var map = $GridMap
var rotating = false
var left = 1;
var down = 2;
var right = 3;
var up = 4;

var attackPath = load("res://tmp/sickassattack.tscn")

# when changing camera, just shift ui keys left-wise or right-wise according to rotation amounts
# [l,d,r,u]

func _ready():
	player.transform.origin

func _input(event: InputEvent) -> void:	
	if event.is_action_released("ui_text_caret_word_left"):
		rotating = false
	if !event.is_pressed():
		return
	if event.is_action_pressed("ui_text_caret_word_left"):
		rotating = true
	
	if event.is_action_pressed("action_attack"):
		match up:
			1:
				var newAttack = attackPath.instantiate()
				newAttack.set_position(Vector3(player.position.x - 2, player.position.y, player.position.z))
				newAttack.rotation = player.rotation
				add_child(newAttack)
			2:
				var newAttack = attackPath.instantiate()
				newAttack.set_position(Vector3(player.position.x, player.position.y, player.position.z + 2))
				newAttack.rotation = player.rotation
				add_child(newAttack)
			3:
				var newAttack = attackPath.instantiate()
				newAttack.set_position(Vector3(player.position.x + 2, player.position.y, player.position.z))
				newAttack.rotation = player.rotation
				add_child(newAttack)
			4:
				var newAttack = attackPath.instantiate()
				newAttack.set_position(Vector3(player.position.x, player.position.y, player.position.z - 2))
				newAttack.rotation = player.rotation
				add_child(newAttack)
		print(map.local_to_map(player.position))
		return;
	
	if rotating:
		if event.is_action("camera_up"):
			player.rotation.y += 0
		elif event.is_action("camera_right"):
			player.rotation.y -= deg_to_rad(90)
			left -= 1;
			if left == 0: left = 4;
			down -= 1;
			if down == 0: down = 4;
			right -= 1;
			if right == 0: right = 4;
			up -= 1;
			if up == 0: up = 4;
		elif event.is_action("camera_down"):
			player.rotation.y += deg_to_rad(180)
			left += 2;
			if left == 5: left = 1;
			if left == 6: left = 2;
			down += 2;
			if down == 5: down = 1;
			if down == 6: down = 2;
			right += 2;
			if right == 5: right = 1;
			if right == 6: right = 2;
			up += 2;
			if up == 5: up = 1;
			if up == 6: up = 2;
		elif event.is_action("camera_left"):
			player.rotation.y += deg_to_rad(90)
			left += 1;
			if left == 5: left = 1;
			down += 1;
			if down == 5: down = 1;
			right += 1;
			if right == 5: right = 1;
			up += 1;
			if up == 5: up = 1;

	else:
		if event.is_action("move_left"):
			match left:
				1:
					player.position.x -= 2;
				2:
					player.position.z += 2;
				3:
					player.position.x += 2;
				4:
					player.position.z -= 2;
		elif event.is_action("move_right"):
			match right:
				1:
					player.position.x -= 2;
				2:
					player.position.z += 2;
				3:
					player.position.x += 2;
				4:
					player.position.z -= 2;
		elif event.is_action("move_up"):
			match up:
				1:
					player.position.x -= 2;
				2:
					player.position.z += 2;
				3:
					player.position.x += 2;
				4:
					player.position.z -= 2;
		elif event.is_action("move_down"):
			match down:
				1:
					player.position.x -= 2;
				2:
					player.position.z += 2;
				3:
					player.position.x += 2;
				4:
					player.position.z -= 2;
