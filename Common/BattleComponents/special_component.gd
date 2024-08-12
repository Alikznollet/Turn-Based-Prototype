extends Component
class_name SpecialComponent

func open_component():
	component_completed.emit("special")
	
func close_component():
	print("closed")
