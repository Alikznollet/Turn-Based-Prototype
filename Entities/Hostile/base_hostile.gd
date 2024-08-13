extends HostileEntity

func handle_turn():
	await get_tree().create_timer(0.5).timeout
	current_move = AttackItem.new()
	current_move.damage = 5
	current_move.item_name = "hostile_attack"
	current_move.target = get_tree().get_nodes_in_group("Friendly").pick_random()
	turn_over.emit(current_move)

func _on_marker_texture_changed():
	$AudioStreamPlayer.play()
