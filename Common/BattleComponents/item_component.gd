extends Component
class_name ItemComponent

@export var UI: BattleInventoryUI

func open_component():
	UI.open_menu()
	
func choice_made(action: String):
	component_completed.emit(action)
	
func close_component():
	component_closed.emit()
	
