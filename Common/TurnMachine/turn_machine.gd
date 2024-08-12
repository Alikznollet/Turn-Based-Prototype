################################################################################
## Machine used for simulating turn-based combat.
## Made by @Alikz
################################################################################

extends Node
class_name TurnMachine

var friendly_entities: Array[FriendlyEntity]
var hostile_entities: Array[HostileEntity]

## When battle is started all of the friendly and hostile entities are added to their
## respective groups. This does not take in account the speed of the entity.
func _ready():
	for child in get_children():
		if child is FriendlyEntity:
			friendly_entities.append(child)
		elif child is HostileEntity:
			hostile_entities.append(child)
	
	_next_player(0)

## This method cycles through all of the friendly entities on the field and handles
## their action picking sequences.
func _next_player(index: int):
	print('turn handling')
	friendly_entities[index].handle_turn()
	await friendly_entities[index].turn_over
	print('turn handled')
	await get_tree().create_timer(1).timeout
	if index + 1 < friendly_entities.size():
		_next_player(index + 1)
	else:
		await _execute_moves()
		_handle_hostiles()
		
## This method handles all hostiles after another and immediately plays their
## actions after being picked.
func _handle_hostiles():
	for hostile in hostile_entities:
		hostile.handle_turn()
		await hostile.turn_over
		
	_next_player(0)
		
## Executes all of the friendly entities' moves.
func _execute_moves():
	for player in friendly_entities:
		print(player.current_move)
		
