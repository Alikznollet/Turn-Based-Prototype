extends HBoxContainer
class_name BattleInventorySlot

signal item_selected(item: String)

@export var selected_texture: Texture2D
@export var base_texture: Texture2D

func hover():
	$TextureRect.texture = selected_texture
	$InventoryButton.visible = true
	
func unhover():
	$InventoryButton.visible = false
	$TextureRect.texture = base_texture
	
func select():
	item_selected.emit("item")
