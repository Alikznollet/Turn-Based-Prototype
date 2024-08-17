extends Node
class_name DamageAmper

signal damage_amped()

var enabled: bool = false

func enable_amper():
	enabled = true 
	
func disable_amper():
	enabled = false
	
func _process(delta: float) -> void:
	if enabled:
		if Input.is_action_pressed("space"):
			print("amped")
			damage_amped.emit()
			disable_amper()
	
