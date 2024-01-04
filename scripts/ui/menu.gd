extends Control

@export var game:PackedScene 

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(game)

func _on_options_pressed() -> void:
	print("show options menu...")


func _on_quit_pressed() -> void:
	get_tree().quit()
