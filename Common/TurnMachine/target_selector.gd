extends Node
class_name TargetSelector

signal target_selected(item: Item)
signal stop_selection()

var item: Item

var active: bool = false
var enemies: Array[Node]

var current_index: int
var current_enemy: Entity

func start_selection():
	# NOTE: This ensures no wrong inputs are made
	await get_tree().create_timer(0.2).timeout
	enemies = get_tree().get_nodes_in_group("Hostile")
	for enemy in enemies:
		enemy.enable_marker()
		
	current_index = 0
	current_enemy = enemies[current_index]
	current_enemy.hover_marker()
	active = true
	
func close_selection():
	active = false
	for enemy in enemies:
		enemy.disable_marker()
	current_enemy.unhover_marker()

func _switch_index(delta: int):
	current_index += delta
	if current_index < 0:
		current_index = enemies.size() - 1
	elif current_index >= enemies.size():
		current_index = 0
	
	current_enemy.unhover_marker()
	current_enemy = enemies[current_index]
	current_enemy.hover_marker()
	
func _process(_delta):
	if active:
		if Input.is_action_just_pressed("left"):
			_switch_index(-1)
		elif Input.is_action_just_pressed("right"):
			_switch_index(1)
			
		if Input.is_action_just_pressed("space"):
			# TODO: set the current target inside the action.
			close_selection()
			item.target = current_enemy
			target_selected.emit(item)
		elif Input.is_action_just_pressed("x"):
			close_selection()
			stop_selection.emit()

func _on_battle_choice_menu_action_chosen(item):
	self.item = item
	start_selection()
