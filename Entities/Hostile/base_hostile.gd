extends HostileEntity

func handle_turn():
	await get_tree().create_timer(0.5).timeout
	current_move = "hostile"
	turn_over.emit()

func _on_marker_texture_changed():
	$AudioStreamPlayer.play()
