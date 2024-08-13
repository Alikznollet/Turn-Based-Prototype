extends HostileEntity

func handle_turn(entities: Array[Entity]):
	await get_tree().create_timer(0.5).timeout
	current_move = "hostile"
	turn_over.emit()
