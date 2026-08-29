extends Area2D

var npcs_list: Array[NPC] = []
var highlighted_npc: NPC = null;

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("npc"):
		npcs_list.append(body)
		print("npc entered range") #debug

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("npc"):
		npcs_list.erase(body)
		print("npc left range") #debug

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_highlight()
	

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if npcs_list.size() > 0:
			highlighted_npc.activate_dialogue()

func get_closest_npc() -> Node2D:
	var closest_npc: Node2D;
	var closest_distance = INF;
	
	for npc in npcs_list:
		var distance = global_position.distance_to(npc.global_position)
		
		if distance < closest_distance:
			closest_distance = distance
			closest_npc = npc
			
	return closest_npc

func update_highlight() -> void:
	var closest_npc = get_closest_npc()
	
	if closest_npc == highlighted_npc:
		return
		
	if highlighted_npc != null:
		highlighted_npc.set_highlight(false)
		
	if closest_npc != null:
		closest_npc.set_highlight(true)
		
	highlighted_npc = closest_npc
