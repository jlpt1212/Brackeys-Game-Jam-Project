extends Area2D

var interactable_list: Array[Node2D] = []
var highlighted_interactable: Node2D = null;

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("npc") or body.is_in_group("interactable"):
		interactable_list.append(body)
		print("npc entered range") #debug

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("npc") or body.is_in_group("interactable"):
		interactable_list.erase(body)
		print("npc left range") #debug

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_highlight()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if interactable_list.size() > 0:
			if highlighted_interactable.is_in_group("npc"):
				highlighted_interactable.activate_dialogue()
			elif highlighted_interactable.is_in_group("interactable"):
				highlighted_interactable.trigger_interact()

func get_closest_interactable() -> Node2D:
	var closest_interactable: Node2D = null;
	var closest_distance = INF;
	
	for interactable in interactable_list:
		var distance = global_position.distance_to(interactable.global_position)
		
		if distance < closest_distance:
			closest_distance = distance
			closest_interactable = interactable
			
	return closest_interactable

func update_highlight() -> void:
	var closest_interactable = get_closest_interactable()
	
	if closest_interactable == highlighted_interactable:
		return
		
	if highlighted_interactable != null:
		highlighted_interactable.set_highlight(false)
		
	if closest_interactable != null:
		closest_interactable.set_highlight(true)
		
	highlighted_interactable = closest_interactable
