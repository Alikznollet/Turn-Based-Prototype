extends Component
class_name SpecialComponent

@export var UI: BattleInventoryUI

func _ready():
	UI.connect("choice_made", choice_made)
	UI.connect("menu_quit", close_component)
	ITEMS.append("shell")

func open_component():
	UI.open_menu(self)
	
func choice_made(action: String):
	component_completed.emit(action)
	
func close_component():
	component_closed.emit()
