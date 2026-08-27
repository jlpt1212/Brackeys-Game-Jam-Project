extends CharacterBody2D
class_name NPC

@onready var sprite: Sprite2D = $Sprite2D
#dialogue settings
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func set_highlight(enabled: bool) -> void:
	sprite.material.set_shader_parameter("highlight_enabled", enabled)

func activate_dialogue() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
