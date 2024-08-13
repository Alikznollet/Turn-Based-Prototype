extends Sprite2D
class_name BattleButton

signal action_completed(item: Item)
signal action_broken_down()

@export var icon_texture: Texture2D
@export var component: Component

func _ready():
	$Icon.texture = icon_texture
	component.connect("component_closed", deselected)
	component.connect("component_completed", completed)

func started_hovering():
	$Hover.play()
	frame = 1
	
func stopped_hovering():
	frame = 0
	
func selected():
	component.open_component()
	
func deselected():
	action_broken_down.emit()
	
func completed(item: Item):
	component.close_component()
	action_completed.emit(item)
	
