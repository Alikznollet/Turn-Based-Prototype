extends Component
class_name AttackComponent

func open_component():
	var item: AttackItem = AttackItem.new()
	# NOTE: this is all temporary
	item.item_name = "basic_attack"
	item.damage = 10
	item.cutscene = load("res://Common/Animations/Attacks/basic_attack.tscn")
	component_completed.emit(item)
	
func close_component():
	pass
