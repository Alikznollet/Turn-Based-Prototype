extends FriendlyEntity
class_name Player

func handle_turn():
	$BattleChoiceMenu.start_choice()

#func _on_battle_choice_menu_action_chosen(action: String):
	#current_move = action
	#turn_over.emit()

func _on_target_selector_target_selected(action: String):
	current_move = action
	turn_over.emit()

func _on_target_selector_stop_selection():
	handle_turn()
