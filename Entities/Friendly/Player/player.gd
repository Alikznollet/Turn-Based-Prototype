extends FriendlyEntity
class_name Player

func handle_turn():
	$BattleChoiceMenu.start_choice()

func _on_target_selector_target_selected(item: Item):
	current_move = item
	turn_over.emit()

func _on_target_selector_stop_selection():
	handle_turn()
