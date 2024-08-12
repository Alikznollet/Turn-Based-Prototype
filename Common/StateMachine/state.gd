extends Node
class_name State

signal Transition(state: State, new_state_name: String)
@onready var player: Player = get_tree().get_first_node_in_group("Player")
var previous_state: State

func Enter(_state: State) -> void:
	pass
	
func Exit() -> void:
	pass
	
func Update(_delta: float) -> void:
	pass
	
func Physics_Update(_delta: float) -> void:
	pass
