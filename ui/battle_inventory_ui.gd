extends CanvasLayer
class_name BattleInventoryUI

signal choice_made(action: String)
signal menu_quit()

var slots: Array[BattleInventorySlot]
@onready var quitMenu: InventoryButton = $QuitMenu
@onready var inventory_slot: PackedScene = preload("res://ui/battle_inventory_slot.tscn")
var current_index: int
var currently_selected
var active: bool = false

func _ready():
	visible = false
	quitMenu.visible = true
		
func open_menu(component: Component):
	quitMenu.unhover()
	_load_component(component)
	if slots.size() > 0:
		current_index = 0
		currently_selected = slots[current_index]
	else:
		currently_selected = quitMenu
		current_index = -1
	currently_selected.hover()
	visible = true
	active = true
	$Timer.start()
	
func close_menu():
	visible = false
	active = false
	
func _switch_index(delta: int):
	var new_index: int = current_index + delta
	
	if new_index == -1 or new_index == slots.size():
		currently_selected.unhover()
		currently_selected = quitMenu
		current_index = -1
		currently_selected.hover()
	elif new_index == -2:
		current_index = slots.size() - 1
		currently_selected.unhover()
		currently_selected = slots[current_index]
		currently_selected.hover()
	else:
		current_index = new_index
		currently_selected.unhover()
		currently_selected = slots[current_index]
		currently_selected.hover()
	
func _process(_delta):
	if active:
		if Input.is_action_just_pressed("up"):
			_switch_index(-1)
		elif Input.is_action_just_pressed("down"):
			_switch_index(1)
			
		if Input.is_action_just_pressed("space") and $Timer.is_stopped():
			currently_selected.select()
			
func _item_selected(item: String):
	choice_made.emit(item)
	close_menu()

func _on_quit_menu_quit_menu():
	menu_quit.emit()
	close_menu()
	
func _load_component(component: Component):	
	for n in $TextureRect/VBoxContainer.get_children():
		$TextureRect/VBoxContainer.remove_child(n)
		n.queue_free()
	
	for item in component.ITEMS:
		var slot: BattleInventorySlot = inventory_slot.instantiate()
		## TODO: setters here so the item also displays in the slot
		slot.set_item(item)
		$TextureRect/VBoxContainer.add_child(slot)
		
	slots.clear()
		
	print($TextureRect/VBoxContainer.get_children())
	for slot in $TextureRect/VBoxContainer.get_children():
		slots.append(slot)
		slot.connect("item_selected", _item_selected)
	
