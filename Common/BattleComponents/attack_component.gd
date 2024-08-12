extends Component
class_name AttackComponent

func open_component():
	component_completed.emit("attack")
	
func close_component():
	print("closed")
