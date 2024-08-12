extends Node
class_name TurnMachine

var friendly_entities: Array[FriendlyEntity]
var hostile_entities: Array[HostileEntity]

func _ready():
	for child in get_children():
		if child is FriendlyEntity:
			friendly_entities.append(child)
		elif child is HostileEntity:
			hostile_entities.append(child)
			
	print(friendly_entities)
	print(hostile_entities)
	_next_player(0)

func _next_player(index: int):
	await friendly_entities[index].handle_turn()
	if index + 1 < friendly_entities.size():
		_next_player(index + 1)
	else:
		await _execute_moves()
		_handle_hostiles()
		
func _handle_hostiles():
	for hostile in hostile_entities:
		hostile.handle_turn()
		
	_next_player(0)
		
func _execute_moves():
	for player in friendly_entities:
		print(player.current_move)
