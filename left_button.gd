extends Button

@export var camera: Camera2D
var offset = Vector2(-1152, 0)
@export var left = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	if camera:
		var tween = create_tween()
		var target = camera.global_position + offset
		tween.tween_property(camera, "global_position", target, 1.0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
