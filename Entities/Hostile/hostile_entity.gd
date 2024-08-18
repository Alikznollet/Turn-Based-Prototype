extends Entity
class_name HostileEntity

@export var marker: Sprite2D

func _ready():
	marker.visible = false
	add_to_group("Hostile")
	hitmarker = preload("res://ui/hitmarker.tscn")

func enable_marker():
	marker.visible = true
	
func disable_marker():
	marker.visible = false
	
func hover_marker():
	marker.frame = 1
	
func unhover_marker():
	marker.frame = 0
