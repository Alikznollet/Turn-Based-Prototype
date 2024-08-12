extends HostileEntity

func handle_turn():
	await get_tree().create_timer(1).timeout
	print('hostile')
	turn_over.emit()
