extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

func set_highlight(enabled: bool) -> void:
	sprite.material.set_shader_parameter("highlight_enabled", enabled)
