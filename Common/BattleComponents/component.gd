extends Node
class_name Component

signal component_closed()
signal component_completed(item: Item)

var ITEMS: Array[Item] = []

func open_component():
	pass
	
func close_component():
	pass
