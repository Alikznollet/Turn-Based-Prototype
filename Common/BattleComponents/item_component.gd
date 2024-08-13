extends Component
class_name ItemComponent

@export var UI: BattleInventoryUI

func _ready():
	UI.connect("choice_made", choice_made)
	UI.connect("menu_quit", close_component)
	
	# PLACEHOLDERS
	var consumable: ConsumableItem = ConsumableItem.new()
	consumable.hp_restore_amount = 10
	consumable.item_name = "heal potion"
	ITEMS.append(consumable)

func open_component():
	UI.open_menu(self)
	
func choice_made(item: Item):
	component_completed.emit(item)
	
func close_component():
	component_closed.emit()
	
