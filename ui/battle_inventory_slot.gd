extends HBoxContainer
class_name BattleInventorySlot

signal item_selected(item: Item)

var item: Item

@export var selected_texture: Texture2D
@export var base_texture: Texture2D

func hover():
	$TextureRect.texture = selected_texture
	$InventoryButton.visible = true
	$AudioStreamPlayer.play()
	
func unhover():
	$InventoryButton.visible = false
	$TextureRect.texture = base_texture
	
func select():
	item_selected.emit(item)
	
func set_item(item: Item):
	self.item = item
	$TextureRect/Label.text = item.item_name
