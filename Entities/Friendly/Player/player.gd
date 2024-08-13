extends FriendlyEntity
class_name Player

func handle_turn(entities: Array[Entity]):
	$BattleChoiceMenu.start_choice()
	for entity in entities:
		if entity is HostileEntity:
			enemy_list.append(entity)

func _on_battle_choice_menu_action_chosen(action: String):
	current_move = action
	turn_over.emit()
