extends CharacterBody2D
class_name NPC

@onready var sprite: Sprite2D = $Sprite2D
#dialogue settings
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func _ready() -> void:
	if sprite.material is ShaderMaterial:
		sprite.material = sprite.material.duplicate()
		
		sprite.material.set_shader_parameter("highlight_enabled", false)

func set_highlight(enabled: bool) -> void:
	sprite.material.set_shader_parameter("highlight_enabled", enabled)

func activate_dialogue() -> void:
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
