extends Node2D

signal action_chosen(action: String)

var sprites: Array[BattleButton]
var currently_selected: BattleButton
var current_index: int
var active: bool = false

func _ready():
	visible = false
	for battle_button in get_children():
		if battle_button is BattleButton:
			sprites.append(battle_button)
			battle_button.connect("action_completed", choice_made)
			battle_button.connect("action_broken_down", restart)

func start_choice():
	current_index = 0
	currently_selected = sprites[current_index]
	currently_selected.started_hovering()
	visible = true
	active = true
	
func restart():
	active = true
			
func _switch_index(delta: int):
	current_index += delta
	currently_selected.stopped_hovering()
	currently_selected = sprites[current_index]
	currently_selected.started_hovering()
	
func _process(_delta):
	if active:
		if Input.is_action_just_pressed("left") and current_index > 0:
			_switch_index(-1)
		elif Input.is_action_just_pressed("right") and current_index < sprites.size() - 1:
			_switch_index(1)
			
		if Input.is_action_just_pressed("space"):
			currently_selected.selected()
			active = false
			
func choice_made(action: String):
	visible = false
	active = false
	
	action_chosen.emit(action)
	currently_selected.stopped_hovering()
