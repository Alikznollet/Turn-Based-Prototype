extends Component
class_name SpecialComponent

@export var UI: BattleInventoryUI

func _ready():
	UI.connect("choice_made", choice_made)
	UI.connect("menu_quit", close_component)
	
	# PLACEHOLDERS
	var special1: SpecialAttackItem = SpecialAttackItem.new()
	special1.damage = 5
	special1.item_name = "special1"
	special1.sp_cost = 3
	ITEMS.append(special1)

func open_component():
	UI.open_menu(self)
	
func choice_made(item: Item):
	component_completed.emit(item)
	
func close_component():
	component_closed.emit()
