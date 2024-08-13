extends CharacterBody2D
class_name Entity

@export_group("Battle Stats")
@export var health: HealthComponent
@export var speed: int

signal turn_over()

var current_move: String
var enemy_list: Array[Entity]

func handle_turn(entities: Array[Entity]):
	pass
	
func enable_marker():
	pass
	
func disable_marker():
	pass
	
func hover_marker():
	pass
	
func unhover_marker():
	pass
