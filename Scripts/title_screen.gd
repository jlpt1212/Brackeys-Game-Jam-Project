extends Node2D

@export var camera: Camera2D

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game Day 1.tscn")

func _on_rules_button_pressed() -> void:
	camera.position.y += 648

func _on_back_button_pressed() -> void:
	camera.position.y -= 648

func _on_credits_button_pressed() -> void:
	camera.position.y += 1296
	
func _on_back_button_credits_pressed() -> void:
	camera.position.y -= 1296
