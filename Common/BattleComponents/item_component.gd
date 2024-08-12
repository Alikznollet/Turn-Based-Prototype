extends Component
class_name ItemComponent

func open_component():
	component_completed.emit("item")
	
func close_component():
	print("closed")
