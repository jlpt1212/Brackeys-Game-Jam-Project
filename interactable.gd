extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
@export var player: CharacterBody2D;
@export var camera: Camera2D;
@export var stair_down_1: bool = false;
@export var stair_down_2: bool = false;
@export var stair_up_1: bool = false;
@export var stair_up_2: bool = false;
@export var meeting_button: bool = false;

func _ready() -> void:
	if sprite.material is ShaderMaterial:
		sprite.material = sprite.material.duplicate()
		sprite.material.set_shader_parameter("highlight_enabled", false)

func set_highlight(enabled: bool) -> void:
	sprite.material.set_shader_parameter("highlight_enabled", enabled)

func trigger_interact() -> void:
	if stair_down_1:
		player.position = Vector2(189, 800)
		camera.reset_smoothing()
	elif stair_down_2:
		player.position = Vector2(240, 1590)
		camera.reset_smoothing()
	elif stair_up_1:
		player.position = Vector2(410, 175)
		camera.reset_smoothing()
	elif stair_up_2:
		player.position = Vector2(189, 800)
		camera.reset_smoothing()
	elif meeting_button:
		player.position = Vector2(2200, 0)
		camera.reset_smoothing()
