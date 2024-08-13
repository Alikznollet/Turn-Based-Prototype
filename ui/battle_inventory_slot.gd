extends HBoxContainer
class_name BattleInventorySlot

signal item_selected(item: String)

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
	item_selected.emit($TextureRect/Label.text)
	
func set_item(item: String):
	# NOTE: This is still a String and needs to at one point contain the item itself for convenience
	$TextureRect/Label.text = item
