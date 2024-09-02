extends CharacterBody2D
class_name Entity

@export_group("Battle Stats")
@export var health: HealthComponent
@export var speed: int

@onready var hitmarker: PackedScene

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

	
