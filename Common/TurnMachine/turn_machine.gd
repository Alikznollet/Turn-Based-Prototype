################################################################################
## Machine used for simulating turn-based combat.
## Made by @Alikz
################################################################################

extends Node
class_name TurnMachine

var entities: Array[Entity]

## When battle is started all of the friendly and hostile entities are added to their
## respective groups.
## Also sorts the entities inside the battle based on speed, so the fastest one
## starts attacking.
func _ready():
	for child in get_children():
		entities.append(child)
		
	entities.sort_custom(_sort_speed)
	
	_next_entity(0)

## This method cycles through all of the friendly entities on the field and handles
## their action picking sequences.
func _next_entity(index: int):
	var entity: Entity = entities[index]
	entity.handle_turn()
	await entity.turn_over
	
	print(entity.current_move.item_name)
	print(entity.current_move.target)
	
	entity.current_move.target.health.damage(entity.current_move.damage)
	
	await get_tree().create_timer(0.5).timeout
	# TODO: make an entity or player correctly display basic moves with
	# correct timing here
	
	
	if index + 1 == entities.size():
		_next_entity(0)
	else:
		_next_entity(index + 1)
		
func _sort_speed(a: Entity, b: Entity):
	return a.speed > b.speed
		
		
