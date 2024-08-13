extends CharacterBody2D
class_name Entity

@export_group("Battle Stats")
@export var health: HealthComponent
@export var speed: int

signal turn_over()

var current_move: Item

func handle_turn():
	pass
	
func enable_marker():
	pass
	
func disable_marker():
	pass
	
func hover_marker():
	pass
	
func unhover_marker():
	pass
	
func health_change(update: HealthUpdate):
	print(update.current_health)
	print(update.previous_health - update.current_health)
	
