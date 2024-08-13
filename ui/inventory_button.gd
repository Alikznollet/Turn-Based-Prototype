extends TextureRect
class_name InventoryButton

signal quit_menu()

@export var icon: Texture2D
@export var selected: Texture2D
@export var base: Texture2D

func _ready():
	$CenterContainer/Icon.texture = icon
	visible = false
	
func hover():
	texture = selected
	$AudioStreamPlayer.play()
	
func unhover():
	texture = base 

func select():
	quit_menu.emit()


